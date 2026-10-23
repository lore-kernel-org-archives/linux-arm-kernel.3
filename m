Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7890606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CgHQakWe;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=omggRumh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=; b=CgHQakWeE7BXvK4KmFBEDGhXQC
	gt6gjYRykshUDCbU4YYE7ZNoMJbwndqCfklmvWQjMRyVX74gAK7lGtmPxvi83AmrZ/W7+06yfctDr
	PVq/B92bPAEx3tvCBKdHNsRZSf50b5SmwIFba5mKic8up+OTaIEY9SbbQEw5ZdsBDHyqC4MYRiN4C
	MYS2AxWR+BH9zKRlm+tMFcC4HC+702cfVooBr5kfcs0UsZLifTwOJwDYzejrNLSuJstqT/NhhNxKQ
	BYB0XC64QWAlZXfMzgIZT3gYjRxUjkaC3wS5UdFGgsj60YfeyGOBWUoZrvnF0hWxHwiID+9J5Pupg
	fjGmcAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9mn-0000000FlcR-44bB;
	Fri, 23 Oct 2026 07:33:58 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9mk-0000000FlZY-3FTE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:33:55 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-51f2e9e6987so968059b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740833; x=1793345633; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=;
        b=omggRumhbbc0QMYvdO49YUGuWvaAwlDVYcMiJL6YawgTrxGwtpUl+c/F5WiPi7im66
         LLteTv7AjRNlzTiJeN1adNTIO9eb/VtyDwZRuF6Wi69TcSphi5QGlgZMhgVORqUWRPJh
         hYCSCrgCE/8CkxruQpSM16g1G0M35YEXbRjuKGYx0+PuqkE0izLNaLPupCoo9vsRLog7
         cDvh+CBfhNld18ZovMD+37HHa4f3qppO1P8aVZ9jJPx48ng0kXdhxO7sDshS992iO5bN
         M64XfmC9yBD19I8M6vl5ERXO5WTvhEo+e4LZ5Gy9QXaPnjH+/pBI0pSoOsmGiiLlbotE
         9Gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740833; x=1793345633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=;
        b=bVCaNoGQTpvExpbH4M066mmcnJgz3WBDPpqY9T/3wtAqQtWbWv9g3lOa2rmTUGCDj3
         ulxMIWOHY5INZxLING9JA/OhKr6cgonOmT4Gq+QrqYn1UB/PGxEXhsb6Qj4+CQV3aRoT
         0mrZoX09EAZKTByL4Yimp2H7EUcfuxSKECYlN95s5M2FIYzp5FTHfbWq17d1V7WOmTt2
         2vDRFVrDhyMGTj6rvYuH20LA82rGJmECeDpj78ep1DhXVOZhxISzTGmVDKkKrB3WrZ5E
         dp1Rziu9O02SAjhTY21yRjcOsGwwqPzNEa9wkIGeJ8WYJXT/jpWkRqaHaInPVf6fKwul
         f+cg==
X-Forwarded-Encrypted: i=1; AKwUvByB5VX8TYJNG7spqDHNDTkz8x9CIbHgA2mrXUhT2eh9goYNmbJFp2Gr33IgoSfG3V2Pae9hOm9b8RYrLiBWWlIz@lists.infradead.org
X-Gm-Message-State: AFq9FYK7j7tE7mnXTdjgtp96yRYSxucsZTwPTAzJepP+FsVmWx39tPo4
	KyjUxkXML+rThPYMcFN23zvZBiaUqkKI6uVmMeIAOB+XghKlfPjHOfbG
X-Gm-Gg: AYBFou1yBwnTN6KpjLI5ZllAB+NTisqdaT2ytGA+8rVtAorDOwUy6bq4NWQlnf4uM6z
	tdzSvuDBnsEhWkOUdqHUuMZoKVXcKNsODrVIh5HKzFGDE9j3MUFbWK0K1lWkcU5ZtCiKyx8zpRK
	+CuM/w3faqb276xJpi6HHpoAe2w9HR+T47il0lyzQQ13zPK2IhONFSQrdUtE5nJFXw5Jj3e5VIn
	uwTRQXxkyqirQ/isAbzUKCC3jeEzuNtegkTrONxflEUEzZcVegxnZeqC8NcO/GoF4wjI5I1wXlJ
	CvcNA66q6LAsXP4ICuaB/mkm2HMlnLb1CxVN9oS474MQ4DkSvDjCJZ+N0rBEZB4DhfBPgkB+DUa
	wa/YkG9loeGVDEJsrfHqmLwm8wjQUmVvJ/JLwaDZLPE88n/lbC3kFM8+BMhxMjq2OAehyLDlbKl
	vkqx0oL7PV15MQTBpZORqmh6+8OH47fFqpSYloCLK1rGMP5i1dYQKK6hKlM0A6QbSX+K64IOBCd
	B4qQO/x+D18LjUetkfvj6OSdO5Mh8Tv81ft2vLLlcbPLULEyJS279+MCF2EW8b5ly/5Qy3RTzdR
	QImTiMRfl9ehSIEsJSNWjZ61fgXe9FpYvDm8Qt6bh0xJ8cTR77oOuvNTAw1ZXCk1JJRsYJcbS4p
	lFAB11ou+qR8zpEOiA0HFHQYJgYS7m0PKjnZCZtVehu9z2OtGds0Ma6j+LIm7+uX+Q/jzt4BUuz
	je+AI=
X-Received: by 2002:a05:6808:c1b6:b0:4f5:1b84:8cd3 with SMTP id 5614622812f47-557eb4799f4mr2769761b6e.24.1792740833602;
        Fri, 23 Oct 2026 00:33:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:33:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Fri, 23 Oct 2026 01:33:48 -0600
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1gbagl14FXFRY6IZGJW2iiDe3
 TqzfIv/L0gclRO01QWRD026LgW2roDmsEyMOhaDM85b4xymffhqxtlbj3uIGUVlxcMiNUFoFG5
 oMFDyLbLo+Vt3/d+l/TDl9wf3/QBuxM/gfAAAAA==
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_003354_864961_A12AEBB7 
X-CRM114-Status: GOOD (  11.26  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

H616 has 256-byte UART FIFOs, but lacks the DesignWare component parameter
register used to discover their capacity. Its debug-divisor and RS485
registers also overlap offsets used to probe optional DesignWare features.

Add an H616 compatible and select a fixed port configuration with the
documented FIFO capacity and receive trigger levels. Preserve the
BUSY-safe integer divisor path and keep the UART gate enabled during
termios changes. Attach the existing 8250 DMA path using single-byte
peripheral bursts, with channel acquisition and PIO fallback handled
by the normal startup path.

The patches add the binding, driver configuration and SoC DTS compatible
in that order. Based on tty-next at 1184f87e2790.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: identify the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 12 +++---
 drivers/tty/serial/8250/8250.h                     |  1 +
 drivers/tty/serial/8250/8250_dw.c                  | 45 ++++++++++++++++++----
 drivers/tty/serial/8250/8250_port.c                |  8 ++++
 5 files changed, 54 insertions(+), 13 deletions(-)
---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


