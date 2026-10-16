Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7E4CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 03:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=; b=pnpz0hREtTxG+DXmFSUHRz2Phl
	/el76qcl6C7Wng179vghdMSMOtXBULZYGTqg2iCKZIrHJnNziac4jacdAR+MblR14cJEiOT/0SUx8
	rDQzHhK4BU+GTNOItDqXRtJAlZRDo90uPV3+LssW6LRkWlhm1amvlbGZrgUTd9JLDwRi5eJYDQP6a
	/KD0BwkHkRQkv4j5dXC/sqpEm9O+LcE0b5CiLN9R+eqq0LbyqikNfAydQZSaYjX+qBOTIyN8/9gQM
	sT/EvNEhUd6i9PvOBwhTCtO6kjk+TB6U4ywP9ZGT41wbu42ZMVFAE70jDaU7uRr3/amSN5BjNtEtC
	7epTTXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtZ-00000001tKs-2fQO;
	Fri, 16 Oct 2026 03:46:13 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtJ-00000001sjC-0SRf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:58 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-82478760557so2035406a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122356; x=1792727156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=g95XIbaGyoxjl7r5twuMVgoV+947+UIVioXdshH9PMidi9KZOtvMalHjmxiBy7rugY
         VpE6vP4eHeuFwN5GJIr982njtMHwVjwGwWPFGvOgt6w1cPapSOcBqZUrkY9RgE/wrgpC
         z4uLZSdRGgwK7bFpS2gmZi0HeHmbIreSros5c0piHB5AMEr5Fun0mgXH/cjB3TxtnOWI
         qKekajygrzgA6pO/Pf3mIRhDZ8u3YmJAmAAwAUfqyOX7pr+pIu5lWA94CgA12JQdpZ1Q
         AT6ONWksunjs+AHShuOKU1cZ/+TN8oEOsxTMUYorBDW+/x0OY9XSAh1fIVvIdsNrFDz1
         ElPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122356; x=1792727156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=rJqolnTcw09bXSGX4jnwF6HPaaY43GJyVXsZU3q6jtMrVfeqlSuGg+rkxEU2xlylTL
         OmRwk4IKsUx5Q/IvR4MI7++HuYHK28tcijIajiNB6kNfhHbLyxKhdTNOz7BJs/YyaiUk
         ljuqMBj3OKmKCtAe6KF3J0GmNMps33zcK7KYNLPCaBalHxJqzgznPpcxrITjHrEjfECu
         iYlLLkkpl9krOAIlY08AHYoJ9LlYaNGVJYYairhSSls6kTyYvPkdD3IJIUIzPQeNWTV0
         tqUa9LMAp7PvAELbnTE+dLWzLWRVvqO6XpldlH/qjOxCOuOexRNuw/SVTA7+GaTF+v1/
         wwjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb60tQm/bXNlsDzNJdi7F/nHix6VruCpvsOJxlRRCi20QvVnvUlj4WTAFl0/647T8GmbaBDAW4xOTPgonTW+XL@lists.infradead.org
X-Gm-Message-State: AFq9FYKnPCNyXueMgC+MVyWEbktBv3VH4s+mrMwLeoLC6aAXaqc0838U
	//ZC4B2wBkeOXhpXV6CR2KHeKszOqhIVE6TaO+A/K/3LEjjPUzGFYdpY
X-Gm-Gg: AYBFou31xLQScLOsDo4vaqBnLYTp8FsqFS3Jb9MAZPNi/cS4mIrsMELj9VA4PScjAFB
	KnWraGQ8rFn69Z8NzZEbK+NxhVzMmUZk5OyVo39i2KHJf8jUN3ObykB431t3X+FkOetb24xEYJu
	X1PLD2C3xtd5bys2IOvEg5ypef1ZMaFv+WRdoYIqH4rLktJBLSZxMw5AAHR4j0ob+jMPRBo1vkV
	QWKpyfZxlQCK4vv/9WssiuZ+5FPmXWNhBvw+FXYwXU6gPX3uWSaZn/P468nOHqm7kh0I8HHfExW
	NEdmhUIndBoxwySgZxclJfAUGPvEWC5oMq11UbBDGczHcRbKDh1sVJpUpKAlnESaZXJCS9QjQnK
	3Hsyf/EepTbOLgMnAIW0ibrlVVEEUbUG+sqimh4S5CsuiWcpTL3csYClvx2UUpWHcnKgJ3frrMS
	BR3RQyaXcWLv31xpg5CBdr05MdUz/I89ggKDoD4pDAysZt11kYx6Dc3ePs8FrCDIDDed2nbCloO
	zDe0mk8O6MDQMWWl0OapL9MKkitGm6RL63XjSsR5v2ztg/o3fRGewIJU9faiDsKSqW3KgtsU1vg
	OnO7TkvYFIMvlulXCY1r1KZjiyOGzJipDmSG/06IKs/SwtNGHjEnAMqnCrLHN8Ko6oozrQ+uNSG
	MFBu7Bv+k/gF0ccpsOxA7Yw==
X-Received: by 2002:a05:6830:43a0:b0:81c:4784:a5e2 with SMTP id 46e09a7af769-83094e738d8mr20216845a34.6.1792122356017;
        Thu, 15 Oct 2026 20:45:56 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:31 -0600
Subject: [PATCH v8 16/17] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-16-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_204557_203153_38F5A0E5 
X-CRM114-Status: GOOD (  13.56  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Allwinner NAND firmware writes the bad-block marker as part of the
controller's randomizer stream. The mainline driver compensates those
two bytes so that the physical marker instead remains plain, even when
the rest of the page is scrambled. On H6/H616, the firmware also places
a fixed amount of ECC-protected user data before the first parity
region, whereas mainline distributes available OOB space among the ECC
steps.

Add an opt-in property selecting that firmware page format for the
configured controller hardware-ECC geometry. It identifies how existing
flash contents must be interpreted, rather than changing the format of
all NAND attached to a controller compatible. Without it, retain the
mainline marker representation and protected-OOB placement.

The property applies to normal ECC transfers. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes,
including the physical randomized marker.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0


