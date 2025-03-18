Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E932C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADnmFXFeM1/2YdPFG8HlA3L1YPgI8t5WD1M+og9aon4=; b=AFN4ebH6619A3JZt4BZUHbL/Oj
	ZIMpaAdrG5Rfqiym9vwgcNz9EtSP3oEfWAaQa6p092FsdqLlvIpzDb9J63giQ/avB3Tp60+2M75Qy
	e9uDHbhvFyvgFZ6Y4Z4N15TaBqeKwFLmelOmhaQELS6icKyyX2k+P7ICjSTSImiCSWtlU7IKtQ7eF
	fFSnaNjSRIiwSCFwlpUutveYF9vMCxqoT60+mjVkMerFz1emQCQJ3AmBO3kj7pdJvDdV/F9xijYmk
	CAuBnOVhMW63SZd4qT7lQFlMZefWbOYrBThHZBCd6anfTasj9pY84y+pewMck6I2nehKkhtAobszy
	sCcMI8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSNQ-00000005Azx-3DlP;
	Tue, 18 Mar 2025 08:32:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSLj-00000005AfG-3HYt;
	Tue, 18 Mar 2025 08:31:00 +0000
X-UUID: 4e959c5203d311f083f2a1c9db70dae0-20250318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ADnmFXFeM1/2YdPFG8HlA3L1YPgI8t5WD1M+og9aon4=;
	b=kQpLHWWJ0FQnHPDGf+NzIqPlSDDM+JhEa/NJ8rZq3YifWCE+bIlZ0GgnkJ0Dl6WGWo3SJGWMvwrC1xBzMhrZOeNkWLaMAXXphD+1YsgWw85/6PzZfeqDCxhZZ0jvy7ZvTjJD60T25aKaZBG7KnDFmE2HhcGowkUJuDQXm2WotcY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5a70ce1e-8bbc-4384-a285-66c3939ada0d,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:251e404a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4e959c5203d311f083f2a1c9db70dae0-20250318
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 581707439; Tue, 18 Mar 2025 01:30:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 18 Mar 2025 16:30:51 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Tue, 18 Mar 2025 16:30:51 +0800
Message-ID: <d584cae48470cf08b1029e0fef1383f92444970b.camel@mediatek.com>
Subject: Re: [PATCH 20/21] wifi: mt76: mt7996: rework mt7996_ampdu_action to
 support MLO
From: Shayne Chen <shayne.chen@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Ryder
 Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Johannes
 Berg <johannes@sipsolutions.net>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-wireless@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Tue, 18 Mar 2025 16:30:51 +0800
In-Reply-To: <38ab11261debaf7e0884080031412808396eea5b.camel@mediatek.com>
References: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
	 <20250312-b4-mt7996-mlo-p2-v1-20-015b3d6fd928@kernel.org>
	 <38ab11261debaf7e0884080031412808396eea5b.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_013059_839278_016EAB9D 
X-CRM114-Status: UNSURE (   9.03  )
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

Hi Lorenzo,

Sorry, please ignore the previous mail.
I just aware that the deflink is now used as the primary/assoc link, so
it should work.

Regards,
Shayne

On Tue, 2025-03-18 at 14:28 +0800, Shayne Chen wrote:
> Hi Lorenzo,
>=20
> On Wed, 2025-03-12 at 12:14 +0100, Lorenzo Bianconi wrote:
> >=20
>=20
> Regards,
> Shayne


