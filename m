Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E97B109C023
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIzstPiLooAoyT1/YZYU3N60HynNZYjCHkfUaSvDG8Q=; b=f6UUcPwWcyz/fGo5gktK6yajgF
	TaOziLCKRO9f+NiabPjD2S8AzQnG0Ro5+KtSocJ/cT2mxYDcvDnJ9EFmtKi47Zn0RLfefWOlV8ksY
	1xUwx8H6Gh963WqW0+OoY3wJ0xGa3FskD2ArpAzFVenIY28DcXZcCye0fmWOuQQt01aYsfUl/1ItN
	YIb9Y9qhcKRxy/ahI3c7SjssB001d3vVBsyjQfPSNPtEYL3vaun0VmmGBhuvnn3fGe6f/r5SFCnDK
	DSOti83iUKXb/SbM1MDggftlWfsVHQnM4Hp4444qPq7uZScriOoREUN+Rw7pHT71/2BqpLd/dEY0p
	WjAo5exQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PFA-00000003bk0-3iRh;
	Wed, 25 Mar 2026 14:30:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PEx-00000003ban-1FEq;
	Wed, 25 Mar 2026 14:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EIzstPiLooAoyT1/YZYU3N60HynNZYjCHkfUaSvDG8Q=; b=pj3my3dL59asVzvJvYX5gd18Yj
	Ea3TooXTGS0CQWRxt2LiqsNSp82XQ1xDztF+xf93nwm20gKc91vAXS6hBYnzoHBQrbQLl8JNRrzGH
	wlvRQfntMjP0sRILKbnOAgs9RTzJ6h4XfNPQ3XwDvtUqETaSBaZaAMn6rA7aAzxdca1NEQDYalanz
	j5LM2UalItgrfmVYxz+bgJAYuQ1DzEJvH/5xr7dshrY5pARrugYigfIM9g92PDdvkVUdWnmp1LPPD
	JhwHFOrsdNw19FhTsIjgfbjgi7XsKKGEKStOF71SfBQGWfEjnb4q4rfcMvTvB69IxaPb89h9aUCvZ
	OCLxwaKw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PEu-00000006M3K-2Tca;
	Wed, 25 Mar 2026 14:29:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B6E54E427EE;
	Wed, 25 Mar 2026 14:29:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D46F6601E2;
	Wed, 25 Mar 2026 14:29:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4554710451A66;
	Wed, 25 Mar 2026 15:29:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774448972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EIzstPiLooAoyT1/YZYU3N60HynNZYjCHkfUaSvDG8Q=;
	b=wvY+FFqzTiSwisTGKrRXWR0jYFs+09psrFJeQhfguL6DicvtQD/tIi+253WAOY/Jg71+Xx
	/kTLUL+DNTj3+l1c56KNVVd5mACd370FJXIgAxZglP72fyTaCxYqT1JxwWNZ2trOrbm0/X
	byrViwrED4FQDvFjbuE2OZtEE4s6O/b1CrP7VxwkzRVeI4aAqm0cG2OXBxxyaz/WSDC7sG
	pl/UO9KvapCs6O7Dh3N296+OzcDLA4Wy3dqNaqDoNXI4ujdu0z1jwqGqqXMI4uWn6kXitP
	o7CfPF/jMB8507LuFKEAP8332aXh+Qm3G3w/SN99sTOpL1cMvROcpi7r2JauFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260317142437.580204-1-richard.genoud@bootlin.com>
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
Subject: Re: [PATCH v3 0/9] mtd: rawnand: sunxi: Fixes user data length for
 H6
Message-Id: <177444896601.837464.10999633870241731377.b4-ty@bootlin.com>
Date: Wed, 25 Mar 2026 15:29:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_142944_680154_6764E1AC 
X-CRM114-Status: GOOD (  11.51  )
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

On Tue, 17 Mar 2026 15:24:28 +0100, Richard Genoud wrote:
> This series introduces the correct usage of user data length for
> H6/H616.
> If the older SoCs must use a fixed value of 4 user data bytes for each
> ECC step, the H6 can have a different value for each step.
> 
> In the first round, the behavior was kept as the one used by A10.
> But we have multiple choices:
> - do like A10 like before (and not use all OOB)
> - do like the vendor kernel (different from A10, but not using all OOB)
> - use the whole OOB for user data bytes
> 
> [...]

Applied to nand/next, thanks!

[1/9] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free code clarification
      commit: 87f9c59f896fd46d45be76d8a8286a6916ce1f1a
[2/9] mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
      commit: 848c13996c55fe4ea6bf5acc3ce6c8c5c944b5f6
[3/9] mtd: rawnand: sunxi: do not count BBM bytes twice
      commit: 8fa72836be11ea70cbfa43f7f2253fa57ccc6ecd
[4/9] mtd: rawnand: sunxi: replace hard coded value by a define - take2
      commit: e3fd963da4c7469757d4f7741157fc5e23da47ed
[5/9] mtd: rawnand: sunxi: make the code more self-explanatory
      commit: 548f87ed47479e08203bc576cb5020f537e49bce
[6/9] mtd: rawnand: sunxi: remove dead code
      commit: 2781542caf681ce52f213152104fb7669263651c
[7/9] mtd: rawnand: sunxi: change error prone variable name
      commit: a1c967f5d6a568dd24583917774e0178b8e39221
[8/9] mtd: rawnand: sunxi: fix typos in comments
      commit: a22f40d9eb1ef587a8201fde3f004173fd8b5e8e
[9/9] mtd: rawnand: sunxi: introduce maximize variable user data length
      commit: 54dcd6aa69db541529a083b31f106ef7d147fea1

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


