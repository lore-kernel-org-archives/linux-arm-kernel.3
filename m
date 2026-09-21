Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC79C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9lrDJGugDn/XEbngsUxQjCalL4q6BemMqvBoYxwI24=; b=AOmE+PNgsehQtA72X6WJz2Cqm/
	J9ijgd6PbLTPal1VbVcNN0QyqIeGEClWHacA1c3bOfZ0pTW9bxfwvStpa8Sh74STfyamyIRYisJT4
	39WhCB4A6htD4KmqeBDvgq38r250Ykm+DrW33zqwd2oJEby2rA3tI1XAe8h1fR3xffvs6w0OCXhod
	iveznZ4WQYDa9exEupry1xe79v65JYX18qjVbjiTvJ0N46Qt8o0NCgxqvAqP7UUn4dRLAZniALlwu
	KWUzByceCspP6qr8ZtPoyJzk2JvOdNmysBMWjYDOWqkmprVGFj8V+2fjShT3ikSh4C6PA5A03U33C
	/dmPNTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dfy-00000002Bkf-0qzo;
	Mon, 21 Sep 2026 13:03:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dfw-00000002Bk2-2HEE;
	Mon, 21 Sep 2026 13:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a9lrDJGugDn/XEbngsUxQjCalL4q6BemMqvBoYxwI24=; b=XuGsWsG1kf6Hy+/v6wd2WBDPnD
	x0lImw4z+BN95UoEZ6OI68pmPFhHtJ2QNkmgf9kW//oscPVa7PP38/3AjfLe/btjNjKE0r6XR6gik
	hDjczh50o6ZkXx2DNEuqRVH/JQRNQV3k5IWPZnUaXU/sLuXCLrhhzj5m8QYeaGxsQyXKh5IYM/QUh
	0nwxmzi065jo0AwU6fl1DIKfLQFK97Ch9/59UxfWYlHAI60li3z2XWWTg9IFNoXwZ+ihoaCUZUBM5
	zRiJ+A8iIc10ElbW0Z5++laA8iMR7CgeerOxZEykH1iYTcwBeGMP7z5cJfSkYLlqZuMAXPncFZUIM
	eXsHqDTg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dfi-0000000CJWh-0A6a;
	Mon, 21 Sep 2026 13:03:11 +0000
X-UUID: baf01f2ab5bc11f1acbe4559397dec65-20260921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=a9lrDJGugDn/XEbngsUxQjCalL4q6BemMqvBoYxwI24=;
	b=oHo5rWTgO0D8TcgUG6tMwgqBajHLA6bnp3H79Uup4526JwG7RbSJXOT5ii/P+Yv1KLa4sdJOwd+1oFpnXlFALM7LbmVz+iUVv/gY1r+VOInQ7v/D96VAJdL6W3ioT+XDcRGPkMqDRXlzvm8u0es6u6tawBwqzdvjyIAHxV85pVQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:65f907f1-9272-4dff-832a-3a40e38890de,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f4e15f7c-2058-4298-90ad-1156c3f1dffd,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|136|836|865|888|898,TC:-5,Cont
	ent:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:
	-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: baf01f2ab5bc11f1acbe4559397dec65-20260921
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1146948144; Mon, 21 Sep 2026 06:02:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 21 Sep 2026 21:02:39 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 21 Sep 2026 21:02:39 +0800
Message-ID: <0a8e36f57f169b9ff75ed7a3d547a36340b98e32.camel@mediatek.com>
Subject: Re: [PATCH v2] scsi: ufs: mediatek: handle mPHY power-on failures
From: Peter Wang <peter.wang@mediatek.com>
To: Pengpeng Hou <hppiscas@163.com>
CC: <chaotian.jing@mediatek.com>, <chu.stanley@gmail.com>,
	<james.bottomley@hansenpartnership.com>, <mkp@kernel.org>,
	<linux-scsi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <martin.petersen@oracle.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <stanleyjhu@google.com>
Date: Mon, 21 Sep 2026 21:02:38 +0800
In-Reply-To: <20260920034953.19535-1-hppiscas@163.com>
References: <20260920034953.19535-1-hppiscas@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_140309_645142_2A771DC8 
X-CRM114-Status: UNSURE (   9.12  )
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

On Sun, 2026-09-20 at 11:49 +0800, Pengpeng Hou wrote:
> The MediaTek helper enables VA09 before powering on the mPHY, but
> ignores the PHY result. A failure can leave VA09 enabled and publish
> mphy_powered_on as true, so a later power-on attempt is skipped.
>=20
> Check phy_power_on(), attempt to unwind VA09 on failure, and leave
> the
> state flag unchanged. Propagate the helper result from host
> initialization as well as its existing resume caller. Keep the
> original
> PHY error if the supply rollback also fails, and report that rollback
> separately.
>=20
> The issue was found by our static-analysis tool.
>=20
> Fixes: 561e3a8726b2 ("scsi: ufs-mediatek: Fix unbalanced clock
> on/off")
> Fixes: cf137b3ea49a ("scsi: ufs-mediatek: Support VA09 regulator
> operations")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---

Reviewed-by: Peter Wang <peter.wang@mediatek.com>

