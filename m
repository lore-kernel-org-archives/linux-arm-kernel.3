Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8132ACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CiMOa3agqihmKRHXpPIpiWtmp44g79fjyf44bbtVoA=; b=YOc2tq0WMXpx9ysWKBb6mTL4UN
	Mh8ZNgjIGD/aXK6PWF+tXtpN8VnXoBlpTgHo3XJhXfluNfKTDruxXAdlTq6VrXZiHxlU9YLmvxlTf
	emHvABD46vyEbFLHir27+lcIJIX5+BH7vBu13VFpIYnDhFUEBPff7ZdG/8HlscGrEeXLcmosE97z/
	e8q7gbNv43HTJ4B53pA2P/1CkySAKHC6ObV+PZeGEmjUdiLsT2h4/0nd4Zmh1nFpVxKyI3yyrDMAS
	BXpz0KMcAL/QMjDO7Zht4by4P2XGjdk1PEDL5KPG1jJ9tvJTd05ejPYKJVBcLE+hKCLGCLvIiP0Xf
	8GAVyDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUl95-0000000F6FN-2uA0;
	Wed, 03 Jun 2026 12:56:31 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUl92-0000000F6Er-0Iry
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7CiM
	Oa3agqihmKRHXpPIpiWtmp44g79fjyf44bbtVoA=; b=bU5bXcdCSZ4FVqWOMRNz
	EKD0qXNsTBisX7AcCRTxhteZs2Sgtx7297djqTHv13MeeS5oaE1WvtD3EC+wI016
	Q/hJ8MreIrrkCW9pz1icwFde7Rk/wpRVALKlFNpVDOPb52V/Gir831vpVM489J9F
	kmtSKtaZqEP7oBpo4mdu4UU3OUtxyN53B//l1bQMiX4SAYXE5wA2O49H0btheZY5
	gT3jWF6Ct6JxLuL1YCKZH/hdPxhOw1SUfgC1lgvLtFBGCb/I9JYbGYL34Y3D4GUd
	jZ188yQRmnygZhA/OwWnYqeycrdv65rboJjABpv5XWp+tp8TTe029Hq7cJHPytdk
	Sg==
Received: (qmail 3282402 invoked from network); 3 Jun 2026 14:56:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2026 14:56:22 +0200
X-UD-Smtp-Session: l3s3148p1@ojBb9FhTHLgujnsK
Date: Wed, 3 Jun 2026 14:56:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: arm: fsl: add TQMa8MPxS board
Message-ID: <aiAkdZ5XuYC-wpCL@ninjato>
References: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_055628_985387_10D80D9B 
X-CRM114-Status: UNSURE (   6.27  )
X-CRM114-Notice: Please train this message.
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

Hi Alexander,

how do you generate the CC list? I wonder because linux-renesas-soc is
added while only files in the freescale directory are touched? Any idea?

Happy hacking,

   Wolfram

