Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A9A606D813
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bj21/ND5;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AigV3d00
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zmeJDP7nY5j/d5FDgC1rx0K58n3Jyjico3gyKAggCz0=; b=Bj21/ND5XyQe5e
	MJEcKfDelIYS516OsDT2W/yZqeF4H9OH86nNZonRa/w526e+k/MbON4+3tYwvstOO/JJlkTC5bO5R
	lPeer9glkv2X3ZXQGByGoM5nJQ2zLpiLwdB/LTko9EyRzxLoM6d24NxYbjxxQRcrXlnY79q93Mc1a
	Wp9BH4qGSbhbqg7p8SGkvsI+zXZgeUlrgzb9u4mRNcv5W4zjgH+/nzPWb541SBjJXbI1LDJcD7zct
	6eZF2CHPaNfBQLQYNl38znXd0ciIs+y6LSfUXKuXng7qnczZgRpoBph8wAyJK1b7lemeswVU1J1dv
	oWKQGC+yU/4IUkJPCaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDc-00000001q6l-03EF;
	Tue, 03 Nov 2026 09:54:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDU-00000001pyK-0Tfz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:54:10 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a208d93758so42083585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699646; x=1794304446; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmeJDP7nY5j/d5FDgC1rx0K58n3Jyjico3gyKAggCz0=;
        b=AigV3d00JugOR+blqYj/YzJSDZ8BdGB3h0pyfUs0ghALbg4nhJlReTFaU8BeslnnkC
         NlzlaGgNFWzwRlvmVGAzT5UoI8/4t9eiFmlSyU2ENBn5NWkC5bc6rBaulIudhC85xwLF
         GYqYXbXaKF79PUuggn5u2aqziXPMw3sLVUmpSrzEpbAx/i5fxhFP2qZSFSW+VT37aUa6
         Sina9eaGsAzc3O+HV9LujKeGUlr613CobfMIRJ42hFnozHnu8GjGfzHB2jONPCI3TOLd
         Ij9vPuTzf5tMJIgCt3DF/AqsJyAphys63tOBfAEh0NnZFbRpxzwLTnzFrtchiC4x6a8R
         N1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699646; x=1794304446;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmeJDP7nY5j/d5FDgC1rx0K58n3Jyjico3gyKAggCz0=;
        b=dNdaSq+eSCV1qF9lPQhaZ867eDJOpTvo7OzpNxYaqrYhfPfb+sHH8Xg2vmQG2+3pKM
         kXBcuNsVFREqr0MGGeKwEIpiddplAPPCSaTkATW4KSmc0G19nVbJ9nymWLiVimDCLxjE
         gJp6DP0KwyslUg/rf48m5awcOWqWbLeQCJkdIRFR7RVPz6VNeZiz8oBJ5AMeJHbyqvKi
         aa1NFyJEb/l8xSV9sd/b0PP3vnvZyBYL1igCMCGHsIcImJm4DoBU49C1wg+t1bG0XsD3
         vZ0MKccEiwH/rlslGwIWGiqi659VpYW9jrOVZPcii5m9YmQ2iqDgujUV27wuNiBMrH+A
         fGVA==
X-Forwarded-Encrypted: i=1; AKwUvBwOq8k88PuZR3WFhx/+K/3GpODaiPrvJUF+96L7QNqVaQZbPZ/jROfWKkvMpJfrCLx7J3Ex9JUuP63YQZR+Hlhw@lists.infradead.org
X-Gm-Message-State: APuU4Z9fKtuhLr7phHH3opThad/jOD+i+6YrqmJsoeyCP01rhdHKmfJG
	JNAQGv4PZuHBZlI6enKA3EAMzAQz5k48KTf3GFXDtAMqL5dsKj0qEuUirsyjuFXc8lM=
X-Gm-Gg: AYBFou0eJ/Z67SsFzzShBhFA1rhu7LQ0gv+xdJiEnvVuoAKpGmm/egLfYJRdKHVvFLV
	lUxceV0qkaqvzv72bOz+KaPHSUdGER3fauX39aiKP8wnxu6HH7xuAIFjwe23DkBEbkrE3D14ob6
	RX6HfWfvRfL5AroOatuSf+3e8zy2syCEHPUao07x6249xL2LdDiyAmJP9PjxAsslImnfg+VVdPk
	ARJmGBS9YqkK3eyEq8vger82bFGDmppQZj4+8ahxx/8xZpYNySUdMGYwdtZbT1nAj3dUDutZnyC
	haWUhwjFtW77S68LvrZ5Az/PNTouLR6909BA8ZUd3TNyWKi/yuYRZRq9Ph0UYdOYHlL/1x0b1K2
	6oZK16FhL6VULp88N5WrynEm7AvrIWvyNvk9d0eN5JvNIOOy3U8BAPo1ZP/OHb+w15sAQZvqHQI
	fACRBcYVSSKHJu2l+7Jok2wXZPMsRqTSxGYAYFWUUAuW+c/UxrujeOr3Wfr4JZMILB/xKsnNFTh
	vXuXFeDEvK30DnE1EZxG1n4AHczp8uRjGIoi3RdCZqKUFIrNEzsczPo8ANjIwLht0VKZq1XmZZE
	pIsgndI0jgQCjpfzsH289yBlfgW/FlQcceaj/hFqZsAvUURaRETGqDqBGJmpLzYL3S6XrxLv
X-Received: by 2002:a05:600c:3547:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ac1889d442mr284036325e9.22.1793699645988;
        Tue, 03 Nov 2026 01:54:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: meson-gxbb-odroidc2: eFuse MAC
 address and LED properties
Message-Id: <179369964538.2330120.3831399405443215739.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015408_177091_A36DF9FE 
X-CRM114-Status: GOOD (  14.82  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sun, 11 Oct 2026 21:31:39 +0300, Fil Dunsky wrote:
> Two small device-tree updates for the Hardkernel ODROID-C2, found while
> adding OpenWrt support for the board.
> 
> Patch 1 wires the eth_mac eFuse nvmem cell (already described in
> meson-gx.dtsi, but so far unused) to the Ethernet controller, narrowed
> to the 6 bytes of the address, so the kernel reads the factory MAC
> address itself instead of relying on the bootloader or a random
> fallback.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet MAC address from eFuse
      https://git.kernel.org/amlogic/c/06c71037627974652c08ae107032d7459f1bb0c3
[2/2] arm64: dts: meson-gxbb-odroidc2: use color and function for the status LED
      https://git.kernel.org/amlogic/c/94dfd6641686dca8d49439896efe678b47e05654

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


