Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE5F606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 02:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kNfTDN2O;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zylpss8P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xbi/DcbTngoNULNMywk8NVdeYwzEvudByqlDGAot+FI=; b=kNfTDN2OKdN9eD
	C+SMMbzVvqT1nmM7uOqYiL2uaKtdsa0ARpJIcdQc15RbWcVZ96cRMF5GEMSkH7OzQTSyyR7Pod83o
	dSl0BaHuSoFCjedEYsx1uA4I4ib5ZdRnpVdBTBgdg4cm7xrxmgRdEVt50rXNLBM8LH6W/skOW8nx2
	HH4grBvH65/DAS6oDnYa8ubCUrq7WVJU+keGC2kxsmmpGeMKpkDF6ols2Fm9npYlvOeqqO0RzVGLe
	7Kbcq0JPAilBpg6vtzjTmCj0HLM14V7IZz3YCB/oApxAipndeMeqnHn3ZBNCbHmbxqCGQTt4wt/pQ
	ZPHLG327DN8EHAGbthbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyoO-0000000CsIB-43kq;
	Sat, 31 Oct 2026 02:27:16 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyoA-0000000Cs8K-1zBY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 02:27:03 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-8256106635eso628331a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 19:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413621; x=1794018421; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbi/DcbTngoNULNMywk8NVdeYwzEvudByqlDGAot+FI=;
        b=zylpss8PlJkzBztPyTvdu5sqUaZFEloO/UetVCdRTGewOdAXCJ1NdQVCBK9CqGaNji
         nv3LGPQCOBjajx3/49Dg7I1Utf5/xIQxP9dzVaRTY6cI/egfB8CRe0HmZuacV7wJlztm
         dbQ4frwFWPQXBKTakqvE83wgVZhBVXQyItt9P+gPY4eCkp700NvyYr7baSm5rEbyoRA1
         sulJt9+ktXyP4zyT43d+ag1csfDgTynHAZ+akSozhmAwinP2mVuYYPzEslxDIBQ92ki0
         haUMfEF1VovUmDootD9gNkDoGXcTxrhgx7hrEJmkyk+8tsFe3LGFdRR4M0Jk0zCJ4/xM
         adaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413621; x=1794018421;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbi/DcbTngoNULNMywk8NVdeYwzEvudByqlDGAot+FI=;
        b=fTvOQghiPazQmZt7X9BKiyqGSUa05vDb+hk7pONH774txY+iiQayLmr6zQyWiTEMLd
         TFnQ35VFKZ6FW2645y9gv3Mr6TA0wNr3M45t/bLhzZXEMtjoKEpXZLF3a/QMc28KvK+t
         uD+1oals++hAhs7CYYh9Fwbe9hkTpMH0TNzhDRzvkmbggKTcDWbodgOznVMeYKsr/PzT
         fATRMqvYpyYtTHDDC4Zi6V2c019mUzwl1esuEht4HjsQHphapeb5TTSJwpFiANUMqhbm
         ZNb33g5GE1LXKS2bvaEwGzCp3pTk3Kc7wudAI73XtsbeAli2j4oM4LiPJd2rN+fvjyCQ
         VXLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgfc+7aEOou+Js2wfQi09is6JQ42AGiM9fp7ylH5GuLBn1ZY/M4FY1jExZLKHXaCjoPaGhcprYImwbYkKZ7gbD@lists.infradead.org
X-Gm-Message-State: AFq9FYJjbBULSFJbAqvXOvS81mbTpQ7ARd3Wp4DemTaXn8f3qxAXPiD1
	43xzjafPTAJzRlU1yXlQBJs00IWaQWMxBnWFz4uml7xA4AlfN0jJf4e3syt3aQ==
X-Gm-Gg: AYBFou18YcqCmr2bqBdDugzxDNXbpqMDccEDg3+J5UKfqItWq0JRTEmwXhYSCa4ahSh
	fAohK7EvISTtHj0d2i+sz/Qx1EJcGVvDRj3L72+R/460BrjDmFK7C8qhAp5mF99lXvPsoGvodH5
	DuuhuJD0lIWO8e19wBoN6hWzDAZgJgu3mKRWF2ihLtSGtSj5WSb45PDJuNN0WCe19/qylNGGZUn
	kBf2FEHC90nmHBN54uN7FE/IHW5SVJb4/XAcTFat26oJz7/U5oiWYIHaTe2aS/johERFO4vG9Rj
	pACehQMSzTKGxKOwTqjM+7ZclAYhuqRXv/LTp8wTGvYEBumnHAjqRwiMhctc7SAkcrCL1VVt7U+
	nzgEM/C/D9MdLZrf+uilN1VBWj4J5c2qfchValWLEIf35m5038YMwnNFTY/NsZOKvtVp8TFvrOq
	EsMTI8GonU49Pg0Bi0VyVCvcRnaIldxioyymU+WY4/bArUk9UBfOv5o3cPH70fYC5Iyh3rCwP7K
	9B196FfbfBVqMC1wpC2NsXe18Bm9sYjyZwMjEpHd+1sPE9W8Uqxv9g4y/l7YES5J0nAAJrp5kea
	H4aI3U9nFYdRqPEMKFrBqYjUv6VtcExUPI6RP70N9rliln4Z+PsYtul9KJp1ezMGrSMZp26z8eR
	BokbeQwcL85yQlsRbgpIOiF/P+os=
X-Received: by 2002:a05:6808:1b06:b0:4c4:9f7e:92ce with SMTP id 5614622812f47-5640dd36723mr2864854b6e.38.1793413621390;
        Fri, 30 Oct 2026 19:27:01 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm2821127b6e.3.2026.10.30.19.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:27:00 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: add Allwinner A733 SoC
Date: Fri, 30 Oct 2026 22:26:59 -0400
Message-ID: <20261031020640-263f7b05-a7s-reply@gmail.com>
In-Reply-To: <20260911001805.0a2e033d@ryzen.lan>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com> <20260613-a733-dts-v1-public-ready-v1-3-7787c94681db@gmail.com> <20260911001805.0a2e033d@ryzen.lan>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_192702_533117_80E6B787 
X-CRM114-Status: GOOD (  10.03  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre,

The v2 cover is Message-ID:
<20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>

I have incorporated your review into the three-patch DT v2. The initial
SoC description now includes the RTC, all UART and main/R I2C instances,
R-PIO/R-CCU, all four MMC controllers, and the documented pin groups.
The board enables UART0, the AXP318W on R-I2C0 and the microSD slot.

On the individual points:

* Base/checks: the series uses official base d89e1d186ec9271bf78e62771779e9fc03bf0fc3
  with the exact public clock, PMIC, pinctrl and UART dependencies listed
  in the cover letter. The full ARM64 dtbs target and final A7S
  W=2 CHECK_DTBS=y check pass.
* RTC: added with its current clock inputs and the board's 32768 Hz
  source. RTC counter advancement was exercised on the board.
* PSCI/timers: removed arm,psci-1.0 and added the ARMv8.2 EL2 virtual
  timer interrupt, PPI 12. The redundant disabled-by-default prose is gone.
* Pins/UARTs: added explicit pinmux values, MMC1/2/3 pin groups and all
  seven main plus two R UARTs. UART0's pins are in the DTSI.
* GIC: added maintenance PPI 9 and the ITS at 0x03440000/0x20000.
  GIC/ITS dma-noncoherent follows your public A733 reference and the
  A523 precedent; the CPUX interconnect diagram supports that integration
  inference. ITS remains disabled; MSI and EL2 delivery are not claimed.
* MMC: all four controllers are described. MMC0-2 retain the existing
  A733/D1 binding. SMHC3 has different DES0/high-address fields and a
  12-bit DES1 length, so I gave it a separate binding and compatible
  instead of claiming D1 programming compatibility. That node remains
  disabled; no operational eMMC driver is claimed.
* I2C/PMIC/R-domain: added all 13 main and three R I2C nodes, R-PIO and
  R-CCU. R-I2C0 and AXP318W are enabled, with schematic-derived PMIC
  inputs/outputs, CPU supplies and pin supplies. The microSD slot uses
  SWOUT2 and PF6 active-high card detect with a pull-down.

Three supporting changes are separate from the DT series: firmware
clock preservation, A733 main/R pinctrl voltage-mode preservation, and
the distinct MMC3 binding. The pinctrl approach follows Vinicius's
October 14 recommendation. The clock/binding prerequisites should land
through their respective trees before the dependent DT changes.

Two final-candidate Cubie A7S RAM boots passed, including eight CPUs,
PMIC/I2C activity, RTC advancement, UART baud changes, 148 MiB of
read-only SD traffic per boot at 50 MHz/four bits/3.3 V, and warm reboot.
The second run crossed the late unused-regulator shutdown boundary.
The tests used vendor boot firmware and a RAM-only BL31 reservation.
They do not claim card writes/hotplug/UHS, operation of the other
controllers, RTC alarms, or EL2/ITS/MSI functionality.

One electrical uncertainty is explicit: the schematic's nominal 2.4 V
BLDO input conflicts with the software-reported 3.3 V BLDO2 selector.
Physical measurements are unavailable. The DT preserves the existing
setting without a voltage constraint or newly enabled LVDS consumer.
Resolving the physical voltage requires inspecting RP220/RP298/RP299
and measuring UP11 LDO2V5-INPUT and BLDO2/VCC-LVDS0 to ground.

The acknowledged board binding is retained, the old MMC binding already
in the selected base is not resubmitted, and the oscillator names,
26 MHz board crystal, four CCU inputs and DTB ordering are corrected.
AI assistance is disclosed as Codex:gpt-6-astra, with Assisted-by: LLM
retained in the patches.

Thanks,
Enzo

