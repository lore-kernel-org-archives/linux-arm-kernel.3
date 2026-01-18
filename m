Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E722C98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 21:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZaN1oHwYtgJvHl/lPTrjlptxFSRmz2iSZBP4z3RVMI=; b=t5a5Te8jKfypWz
	FOcScu2Y2fzZIHv8BDxGV354A2uEH19mpNxF6VN5Jx5ryKcL2IxcPVGqXEYnTyuuz1Pt0QyZeLmWC
	RnjrkC7MII4S0gVLgStsnheHSzJ4ruBWqzAPVtNgD5Fn3+fJJTLSvMw4kW9w5Jxad2od4kOw0aq80
	3U6TUK34D+g06bXAOFY9unwelxfCO0xrg9OnbvyQGEmG5vnTG1zU/5wxJWHFiizwwdRtGoU5qae9v
	8ZD4o243aC/vPz+03GvCRQY0cMbgQ+XbYYCWAnllvzZS2XvoavJIdggVuVs6exKA4y1BKVI+bxRGb
	P5ZWhGubO/Smw31YO/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhaBG-000000010vH-0H0N;
	Sun, 18 Jan 2026 21:19:30 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhaBC-000000010tm-3qHy;
	Sun, 18 Jan 2026 21:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1768771152; x=1769375952; i=frank-w@public-files.de;
	bh=sZaN1oHwYtgJvHl/lPTrjlptxFSRmz2iSZBP4z3RVMI=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HtILRw2XVwOALYR4Lp/Slww2WacEdJ75XgAsTWx9rWGzyeYZ7w09YaXdZogwn4SH
	 i/cbDObZFo13jcc2eST2q4K/9GHn44DDS3np/YsCBqxcXDsRzXWFCjcVKaZJiocf0
	 Bii5f2a0sPUZmAYJr6qDIIMF+NWb3jWRNZsfoElyXVV+bOaSurqTzOjf8L+aFBk2v
	 VbKBhSF/bUqoxc9BP0V+Rk6UX3rwu90un71JKO8dIPXdouIcCEsoc1wNTSZFwXK+T
	 q3a7tHfBS88LzxhnwkPXXNDTpS9u/sk1uHrDpATEnMB/npoaDenFyy5MrQ4Jugc8w
	 j1qiZLsvxXWGM0VnHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ehlo.thunderbird.net ([194.15.86.3]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZTqW-1vL0go21Ic-00TBBf; Sun, 18
 Jan 2026 22:19:12 +0100
Date: Sun, 18 Jan 2026 22:19:12 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
CC: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_arm64=3A_dts=3A_mediatek=3A_mt7?=
 =?US-ASCII?Q?988a=3A_Fix_PCI-Express_T-PHY_node_address?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260115131035.75574-1-angelogioacchino.delregno@collabora.com>
References: <20260115131035.75574-1-angelogioacchino.delregno@collabora.com>
Message-ID: <B5FE3278-9188-42AB-9218-BDD4126931F7@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YiIRAb3ApyTUxW0oJNwcgTy77JFsxp0VK7ZglymXCqOJ+9r3/TJ
 b/urROz7vG6FElsK+9N4X9FvnukRW4nBnoWVg6w+NbK6eKTmhFSxM1xEED/B0YsmTRoJPCN
 HzP0X2OK7H3HiBF0o49DtUiNNFxAqIa57ZkHSfY6PjWMEkxeOJeD4/C9yXpabS/E9BBIWN1
 8PUHTl47EfideOPv0QiTg==
UI-OutboundReport: notjunk:1;M01:P0:y+cPne1xd+Y=;lXwVp7IvfOaEFxrCD+3b2/x1kyM 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 mLqu3x5bKc2A2+/62kvXMH5zJ5335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_131927_308481_245BEAF1 
X-CRM114-Status: UNSURE (   5.28  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

Thanks for fixing this=2E

Am 15=2E Januar 2026 14:10:35 MEZ schrieb AngeloGioacchino Del Regno <ange=
logioacchino=2Edelregno@collabora=2Ecom>:
>The PCIe and USB TPHYs are under the soc bus, which provides MMIO,
>and all nodes under that must use the bus, otherwise those would
>clearly be out of place=2E
>
>Add ranges to both the tphy(s) and assign the address to the main
>node to silence a dtbs_check warning, and fix the children to
>use the MMIO range of t-phy=2E
>
>Fixes: ("f693e6ba55ae arm64: dts: mediatek: mt7988: Add t-phy for ssusb1"=
)
>Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino=2Edelregno@co=
llabora=2Ecom>

Tested-by: Frank Wunderlich <frank-w@public-files=2Ede>

regards Frank

