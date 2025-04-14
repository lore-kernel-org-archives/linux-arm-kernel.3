Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A270EC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQgPEoNql6vdXUVm0t2k2eF33b/Tyd9zVdy+1ffDg0E=; b=o/t5oM9JZLpBzbl2vkFfNiZV/+
	89HbVBK0U7bcx3GCqXbADM/9p0ciLbv9L0RK3nT0mhsKFBsjeGeYaVyWtI6tJACNRrB2ItUmiCShP
	I0KYu38udFis01bmvh7ThuIryOjqxrV3tdBo+haIS97y9TkB3pbMQxtvbTVBnNcXs12aWuiVzoADR
	LnLlWV7TMCput/jE64LmtkMtP7H9xf1CGVzpqcAHfMjJFkwIn1JC2J1O+cKU6oZte9Z3+mKfviw34
	UxWaxWI7GqKQJd7v5BbmUcBksu2XepCIo3uVm3+q/B7PGRdjzbe991ieRoWMz3TWSR1+2jpNP0fqT
	nYk0l8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GWt-00000001MYG-2dcA;
	Mon, 14 Apr 2025 09:55:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GV4-00000001M6R-0iL7;
	Mon, 14 Apr 2025 09:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624388;
	bh=j2SzmPPwkVr+GnHaMaOl0CKRdroaM8UZJyrHL1hnC30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=odvUkYLxZ8YkiJfbG2sJ3UiFMZHrSXey5sdciD5Llb35EwBflcosn0pilMoLJseEG
	 E+5AtdWCC2GZ5e/iLatIwpUomH51Eto4SER+t8W1BbI7u0zvfELBv7GNX6HcLAiu9b
	 DsYwM3ac0/1iljXCpNH7r1qPGwIHeCSdxozsL4Xvp3JjBq7Asn+Hvrjq+IjEtBYbXi
	 kDJbDybJ/3l+qq2f/Y3sgkZKmcsSb4pMqLLjeSg0HXgYq/R8xGFj+/J88AYNUJenIC
	 lmpkeFbTLmehft3lLTXAxToVvl8oZfnDQGzfEZwpReHW0kownW5booaWDbFUBXz795
	 7xMh4ZNE+USmQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 15F9A17E0809;
	Mon, 14 Apr 2025 11:53:08 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Chengci . Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20250408092303.3563231-1-wenst@chromium.org>
References: <20250408092303.3563231-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188: Fix IOMMU device for
 rdma0
Message-Id: <174462438799.45420.5429446309371613057.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_025310_358387_EC5DFEC5 
X-CRM114-Status: UNSURE (   7.71  )
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

On Tue, 08 Apr 2025 17:23:02 +0800, Chen-Yu Tsai wrote:
> Based on the comments in the MT8188 IOMMU binding header, the rdma0
> device specifies the wrong IOMMU device for the IOMMU port it is
> tied to:
> 
>     This SoC have two MM IOMMU HWs, this is the connected information:
>     iommu-vdo: larb0/2/5/9/10/11A/11C/13/16B/17B/19/21
>     iommu-vpp: larb1/3/4/6/7/11B/12/14/15/16A/17A/23/27
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0
      commit: 267623000d11f6d483214be2484555f600393a12

Cheers,
Angelo



