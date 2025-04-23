Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923DFC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdJG21TL+AvOeJeTB8RJ+cFa9H+iGGwKryVw2CrsL0k=; b=X2l02Ft9D3V2hHP3RNbDcPK7dc
	jzBvpIGfVy7UPu3Ue70brYJV4IDGtLLmHGCjMe0OM2wLubHa69yzsQGdqAShd5qUYVY85N9AHZG7g
	3JYPciLvTEM/ZmrryO7ZQeqx8wPbcaATVYFDGkqlYGYHcyZu8j979vcmgzJlZwiiFkc20PYuZhzyV
	yB9XwqnxAVeQuzsBF1rYQj072rIdmHOpcMYucS3+Lys5TOBW8UW9y8d3u1f0mNB0oNoVaP/j1kAex
	h4TlmIKQIi+JO4GLXofFGfxAte+Y9afA0QAVAP4odGPUwamKAzBXiUvH/WGUquRHoRn0Ie46lSPXS
	VJlLLfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7b7R-0000000AprW-0OEi;
	Wed, 23 Apr 2025 14:30:33 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aS5-0000000Af6F-1kxy;
	Wed, 23 Apr 2025 13:47:51 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 28C5961667;
	Wed, 23 Apr 2025 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1745416063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hdJG21TL+AvOeJeTB8RJ+cFa9H+iGGwKryVw2CrsL0k=;
	b=JzGmmKZgT3R57Pwt0GXRMMsCtFazMoMWkuqMY2D9xQOuB/NE14E7uWC74E3A77pWXlqw1e
	QuosA8MFdJteMooqttO5xwm6HcODZ8FDCeF2ppRJL+GU/zvn1S3g7UkMLdvJBMXGoC6kxV
	LU2dsNj/nY/0lXQ+YCJZXB3+ZKiVvjU=
Received: from [IPv6:::1] (unknown [IPv6:2a01:599:a06:ae47:924d:415c:d602:5492])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id AE5951005B4;
	Wed, 23 Apr 2025 13:47:41 +0000 (UTC)
Date: Wed, 23 Apr 2025 15:47:41 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_1/8=5D_dt-bindings=3A_arm=3A?=
 =?US-ASCII?Q?_mediatek=3A_add_bpi-r4_2g5_phy_variant?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250423123339.GA191369-robh@kernel.org>
References: <20250422132438.15735-1-linux@fw-web.de> <20250422132438.15735-2-linux@fw-web.de> <20250423123339.GA191369-robh@kernel.org>
Message-ID: <D036900A-79D2-4C87-9D77-DBF443E12028@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: c11d15a8-4a69-4433-87de-3e7ec32e89b2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_064749_623063_AAFE1234 
X-CRM114-Status: UNSURE (   5.50  )
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

Am 23=2E April 2025 14:33:39 MESZ schrieb Rob Herring <robh@kernel=2Eorg>:
>On Tue, Apr 22, 2025 at 03:24:24PM +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add new compatible for Bananapi R4 with 2=2E5G phy=2E
>> Base board is compatible with existing BPI-R4 only 1 SFP is replaced
>> by RJ45 port and use mt7988 internal phy=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>
>You didn't add Krzysztof's acks on these patches=2E

Sorry,i thought i've added them in my local branch before running format-p=
atch,but it seems i missed that somehow, possibly dropped these changes whi=
le aborting rebase=2E

regards Frank

