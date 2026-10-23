Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86877606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fzSkWjp3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Htc5hmT3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nI3N8MrEeubTFBg+n+hiFqxjlTWdSSoRNoSmz7N6G04=; b=fzSkWjp3V9ikcN
	x6zCOU5KdSj4nzYUX81+4wLqUrQysdrrBttSCwOHX+hTtCwTtiu0nQgsFPTxZw2TzSRHAb7c0FReg
	AWQGl+vi0n4fg8gdn+y6mHyebAkeY5mlxCbqpvLQCZc5Y+5vIFySB7hxo6znxIfw+E5fdInaYL2mx
	aF2+d1Ug6hvvRd9qcUzaCg1tsPVHArSLvyxzIebo/31HxiG1b5A3G4WC2K6exsiQpG9BlWy0VRAsq
	AgY04ONSxMZTChJ0PubFG57PmkJjmqcXXqFu8vfuyQ6B9OWCe/XWhu/ijCUlQuMdAPTpuFT2+2Z58
	UqcmVcPuAfuTYiuJiWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8xB-0000000FbtT-1KaL;
	Fri, 23 Oct 2026 06:40:37 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8wu-0000000FbbB-2okQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:40:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso335876f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737618; x=1793342418; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nI3N8MrEeubTFBg+n+hiFqxjlTWdSSoRNoSmz7N6G04=;
        b=Htc5hmT3G4ig7oHzlJbkQ9cG9ViX1QsBBZF/xF6quDHS7Vr9qnVSiI3jtxpLhsfvyT
         EBdr3gPisDCjAQZ7i9YFyG8SgJa+yomTq7/jE0JGxM/Lhub/T9l7mBx570Vec7yUd54k
         Sp8+BQliVOSNt9QXvdLotbQlyrWlkW2kpKixAV1UfceenidsAVzLI2xIBAq+mnksI9ij
         Un9yY3JXgtiMV/nGHKmQQblBeLoz6e+xiYAfBQWFOYG86RsgfKUEQBmJOmWvQiQCsb5x
         VZD80DRl948mBhH4vPXl/WFhL/NeL3ht0ESvB+xl25JIVuFDGjGbgzCa90VxG3xJ0WQD
         orIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737618; x=1793342418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nI3N8MrEeubTFBg+n+hiFqxjlTWdSSoRNoSmz7N6G04=;
        b=r8AuSwqbfZaQsELldIZc5xYg4n4Mr/JxSDRmSllyVBfvGQF9a10pKHcQ05Ro294DM/
         pcEXO6LcGc6rB1Wxj/tbFsXTOHkr5oxeM4dzzdAgRbatK5e9AKVV4iOuf1DpbwXTKOrS
         zs0BQplsgeqPpwPrSQP/79RVW0p7wGFZNh9oQ0xmxZDbKzYyhKnHWILJkH+OIHrmSnRj
         W5Jv8zI32U82XVVt9MYvpFq3SfNAkkdp5co4HhHUeLwUTWEN9Pu+Ty/F5GTUHeNsMgS3
         s856jlEvtHEufT5Vy56VVXVN6lL1KQqT8OMrmlQLSMt+9JdsHqfGVeKIXndVDmA1QGdM
         MFMw==
X-Gm-Message-State: AFq9FYI9cS+0KnAKEWXwVBRKtE44KFnKrFYSGeq/x2Z08HKtdaVSL80X
	eO4vrFJh3IYF+fdHONcWa7S67ACgoiKnWbTF4AgCCO+Q5VpCRQHV+U4z
X-Gm-Gg: AYBFou36EruoHCFCVFBj0H72GFWgJ3H1GQfy9TGM2wTWBbsRJmbR/AIYe4r3x+FiBg8
	5tFQkFnOktLYBteJTomP6YB2S8aeOceOYxSC7JZWoUghDFdkvpMan1VLyedcJisB8KBT18ICYPz
	hhtMeihw5hYVHd4lLh1CbSvuxTf0bwAgxJgd56NoRzqmeVjVDoTGbdlAvTPOgxkIvd8c7UrrPiP
	zzxvRwQEfjqcM4ax6MLsGEgNJRNJWzOw06mZyDevHSdLAb4fBC3H9L31UQJ6bHBkXD2wnC6tvpy
	vczavar43iOYbc3kH14V1pEDwHsWksg1V5FVMb1XpXteeDQHax6JeDK0mNhzcgWA1Wg0gbkKkxa
	M6jAJro3a6uQGVdFOVlw/H4BGRgJpkamjCvaLDlZ05+BFLWn+o8HiZ8hfArXZxCuGtLZKpdXXX1
	RgkxL17m6jt6DQ00NjnRlCrgUgnGm8LuDWtJV2BNs3uWtCvbY55EP7VfmOJBXrpobS5jQ/f59Pr
	Vc9mSGUATZezNGx4BJ1tDyVGHwukiFloEMTdy7Wb8wtahEzjPI4DMXFvfeS985f6/CfkubcVwaQ
	nh96zFstyI2hXYQVcbPVfBsQPTt5nCD1zBYSIy3LdfB0/GbzIo5hiCXO4mmCQyf9C4neFCOnVii
	xWWI=
X-Received: by 2002:a05:6000:258a:b0:48d:fdc0:7086 with SMTP id ffacd0b85a97d-48e3859a817mr1823119f8f.22.1792737618388;
        Thu, 22 Oct 2026 23:40:18 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:17 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:38 +0200
Subject: [PATCH v3 13/16] Documentation: accel/thames: Add initial docs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-13-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_234020_776827_0ABD5EA5 
X-CRM114-Status: GOOD (  21.34  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With pointers to the other components and how users can make use of it.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 Documentation/accel/index.rst        |  1 +
 Documentation/accel/thames/index.rst | 47 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                          |  1 +
 3 files changed, 49 insertions(+)

diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index cbc7d4c3876a..eb115413db07 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -11,3 +11,4 @@ Compute Accelerators
    amdxdna/index
    qaic/index
    rocket/index
+   thames/index
diff --git a/Documentation/accel/thames/index.rst b/Documentation/accel/thames/index.rst
new file mode 100644
index 000000000000..6382ff2369be
--- /dev/null
+++ b/Documentation/accel/thames/index.rst
@@ -0,0 +1,47 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+============================================================
+ accel/thames Driver for the C7x DSPs from Texas Instruments
+============================================================
+
+The accel/thames driver supports the C7x DSP cores of the Texas Instruments
+J722S as compute accelerators, for workloads such as machine learning
+inference.
+
+Each core runs a firmware that remoteproc (Documentation/staging/remoteproc.rst)
+loads;
+the driver attaches to a core remoteproc has booted, boots one left offline, and
+resets a core through it after a fault or a timeout.  The firmware's source is
+at https://gitlab.freedesktop.org/tomeu/thames-firmware/.
+
+The driver and the firmware of a core share a block of memory reserved in the
+device tree.  It holds the core's Ring, the queue of submitted Jobs in the
+order the core runs them, and its Fence, the sequence number the firmware
+writes as each Job completes.  The driver adds an entry to the Ring and rings a
+mailbox doorbell; the firmware rings one back when the Fence moves.
+
+Each file that opens the device gets a Context: a page table the core switches
+to while it runs the Context's Jobs, so the buffers of one client are isolated
+from the others'.  A buffer is created without a mapping and bound into the
+Context at a DSP address the client chooses.
+
+A Job is created once from a program, its parameters and the transfers the
+core's DMA unit performs around it, and is checked then.  It can then be
+submitted any number of times, in arrays of Jobs that run in order and signal
+sync objects when they finish; the call waits on no sync object, the fences of
+the listed buffers order the work.  The drm-gpu-scheduler spreads the
+submissions over the cores.  A Job that faults leaves a fault record, which
+userspace reads with a query; the capability query returns the sizes and
+addresses userspace compiles against.
+
+Everything else is done in userspace, as a Gallium driver (also called thames)
+that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html
+
+The interface is described in ``include/uapi/drm/thames_accel.h``.
+
+.. kernel-doc:: include/uapi/drm/thames_accel.h
+   :doc: Terms
+
+Hardware currently supported:
+
+* J722S
diff --git a/MAINTAINERS b/MAINTAINERS
index c63ab2d77b01..dce817531184 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8024,6 +8024,7 @@ M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/accel/thames/
 F:	drivers/accel/thames/
 F:	include/uapi/drm/thames_accel.h
 

-- 
2.54.0


