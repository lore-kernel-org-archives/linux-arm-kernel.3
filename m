Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6842606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aWmuA2WU;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YsBqi22q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+RejnB+h8n3B5SjN1/dH/aM6eDuxs01fVfpUcQkNmDQ=; b=aWmuA2WUSusvx1
	9eKFjHbXW9Uaj1ZRRSwo5IGm/MsZxnR4elk+c6UiIqHoIZxtNtKVponBttLvkFeGR8sA654nn9BnP
	/JBBy3V3q2kEgb5yLM8XfQNWr66oAcx4vlYe00qoX+ecOKyRJXRnaZKpSCmOdJC+AlyTmmcmcgegD
	A2tHZWlnRXW+P2WVIGsdQ+76Y1dcpmmxmeslYgmuBg1h/g79CrR4kNDNGkhsfq9IqijsC7OKxK44a
	mNa8d0yR+Aa6NWpQgXEwY7CNhKlMieqaNckW0q2EsXbTxXnrUy2YFOvrkvNabcEobV07FmhMm260c
	csnj3voxrCy/SEuaxGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzTo-00000006bgu-24YH;
	Wed, 28 Oct 2026 08:57:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzTl-00000006bg2-0KAB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 08:57:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1E1B175D;
	Wed, 28 Oct 2026 01:57:46 -0700 (PDT)
Received: from [192.168.178.72] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E2153F7B4;
	Wed, 28 Oct 2026 01:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793177870; bh=qZzzQjsMm43XS3Uzw7+KOUDHHFywhHHO4VzAbejGsvk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YsBqi22qzBrzOdum+ZQ2UTn61F1f43lQDgjubuzIi4xom/NLR8BuOqNN33dmagxCC
	 WqBy+1fcSfVr+HFTY73NEjKOifu6H8G2qq8kcSpx6wTOm+wqOMH1STKVe5W/AzXTOD
	 77urUGd/esefQCC4dOS2R+406xkjOl2QzG5nW2eM=
Message-ID: <10f350ff-8f82-4a3c-beea-4a02d0d179f9@arm.com>
Date: Wed, 28 Oct 2026 09:57:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
To: James Hilliard <james.hilliard1@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_015753_194125_0BA0FC77 
X-CRM114-Status: GOOD (  27.39  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 10/28/26 00:05, James Hilliard wrote:
> H616 has 256-byte UART FIFOs, but lacks the DesignWare component parameter
> register used to discover their capacity. Its debug-divisor and RS485
> registers also overlap offsets used to probe optional DesignWare features.

that affects almost all Allwinner SoCs, not just the H616, so should be 
solved universally, not just for one SoC.

IIUC Chen-Yu has a patch to attribute the right FIFO size, in each 
.dtsi, which I consider the best solution to this problem.

I'd say we wait for -rc1 and then work on top of his patch.

Cheers,
Andre

> 
> Add an H616 compatible for the integration-specific setup. Keep the
> existing 16550A port type and describe its fixed FIFO depth in platform
> data. Use common Allwinner helpers to configure the transmit load and
> receive thresholds from that depth. Configure automatic flow control,
> preserve the BUSY-safe integer divisor path and keep the UART gate enabled
> during termios changes. The H616 configuration uses PIO.
> 
> The series first introduces platform setup callbacks and a shared RX
> trigger conversion helper, then adds the binding, H616 setup and SoC DTS
> changes. Based on tty-next at 6b4b543fa187 with the posted RX
> trigger callback-lifetime fix [0] and DW BUSY-safe divisor fix v4 [1].
> Platform setup runs before installing the BUSY-safe divisor setter.
> 
> [0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
> [1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com
> 
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes in v4:
> - Introduce common Allwinner setup helpers with the fixed FIFO depth
>    supplied by compatible-specific platform data.
> - Rebase onto tty-next at 6b4b543fa187 and the posted DW divisor v4 fix,
>    installing the BUSY-safe setter after platform setup.
> - Use an early return for FIFO-less DMA setup, following Andy's review.
> - Default to generic setup when platform data has no setup callback.
> - Select Octeon's optional-register discovery with IS_ENABLED() in its
>    setup helper, preserving the existing 32-bit and 64-bit behavior.
> - Extract the shared 8250 bytes-to-FCR conversion, including the
>    unsupported-table check, into a preparatory patch and use it for
>    H616, following Andy's review.
> - Set the fixed 256-byte FIFO depth in H616 platform data and omit
>    fifo-size from its binding and DTS, following Krzysztof's review.
> - Precompute the Allwinner RX thresholds during setup and retain the
>    sunxi FIFO-depth helper for filling the table. Use named FCR encodings
>    in the helper, following Jiri's review.
> - Share threshold-table initialization and callback assignment through
>    a sunxi RX trigger setup helper.
> - Group and comment the H616 trigger and RS485 setup.
> - Link to v3: https://patch.msgid.link/20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com
> 
> Changes in v3:
> - Introduce a platform-data setup callback in a preparatory patch,
>    replacing skip_autocfg and preserving the existing Octeon setup.
> - Describe each H616 UART's FIFO capacity with the standard fifo-size DT
>    property and use the value already read by uart_read_port_properties().
> - Derive the Allwinner RX trigger thresholds from the FIFO depth.
> - Use an unsigned trigger index and conditional runtime PM guard,
>    preserving error propagation when the device cannot resume.
> - Rebase onto tty-next, replacing the earlier DMA prerequisites with the
>    posted RX trigger callback-lifetime fix.
> - Separate DMA enablement into follow-up work, retaining PIO operation
>    for the H616 FIFO configuration.
> - Link to v2: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com
> 
> Changes in v2:
> - Keep PORT_16550A and set the FIFO size, transmit load and capabilities
>    during setup, following Andy's review.
> - Select H616 setup through the matched platform-data pointer and remove
>    the type and DMA burst-size platform-data members.
> - Use get_rxtrig/set_rxtrig for the 1/64/128/254-byte receive thresholds,
>    with port locking and runtime PM around register updates. Keep the
>    standard half-full FCR default, selecting 128 bytes on H616.
> - Advertise UART_CAP_AFE so CRTSCTS enables hardware automatic flow control.
> - Rebase onto next-20261023 and declare the posted sun6i pause/lifetime
>    fixes and their prerequisites for DMA enablement.
> - Link to v1: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com
> 
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> To: Jiri Slaby <jirislaby@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Chen-Yu Tsai <wens@kernel.org>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Samuel Holland <samuel@sholland.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> 
> ---
> James Hilliard (5):
>        serial: 8250_dw: select port setup through platform data
>        serial: 8250: share the RX trigger conversion helper
>        dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
>        serial: 8250_dw: configure the Allwinner H616 UART
>        arm64: dts: allwinner: h616: describe the UART integration
> 
>   .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
>   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 +-
>   drivers/tty/serial/8250/8250.h                     |  16 +++
>   drivers/tty/serial/8250/8250_dw.c                  | 138 +++++++++++++++++++--
>   drivers/tty/serial/8250/8250_port.c                |  12 +-
>   5 files changed, 151 insertions(+), 28 deletions(-)
> ---
> base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
> change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
> prerequisite-message-id: <20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com>
> prerequisite-patch-id: d8219673210dac82d3adab41578ff2f76f5862c9
> prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
> prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269
> 
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>


