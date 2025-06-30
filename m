Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6310DC83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szK0J+EuwrE1IYcofSwepObo43x0XQFxl9Sd1cicOCE=; b=SdkXgq/UQgKv5JSem1sDrf6mva
	no15gavJIMOHPrCN7fm+kK2m6/56v6pw3VNRDCHYmYSO/UjJFdJ9Z5Cy3/beLXHvtH6O8Mk7z9lbB
	j7t/LbRhEPtUUxzyoOJ5rpDUpvLDbo9vZvHzdkG5eCU1OBmxifl1Ybu3hHgTeAOOCde91/unn+9K7
	hEQ+UK3VYry7Odo6WH03/jdxih4Q9AOwOaTGezSV+7hXX6PhvxO4BO5peq3S4vraeVRBO53U+gyaq
	L4Ct1g94Hzf130VurzF5YP1/ItiVYvIFtqdPpGfTCjsV930s5uUYI9z0EiZedafLzMli/nyJhKash
	3NyJZbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMm5-00000003ZV3-1HqT;
	Mon, 30 Jun 2025 22:14:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMhB-00000003Yzc-0Ncr;
	Mon, 30 Jun 2025 22:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 297DCA49737;
	Mon, 30 Jun 2025 22:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF04EC4CEE3;
	Mon, 30 Jun 2025 22:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751321387;
	bh=vAzj++/jV6VTrg7u4E0pCrASorfa+yLITSBpP77hHl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9Imj+mO/QgIz7SWK0mNab70Z88CDunmh9M8KADNqYvlLnFC5D2BgSIDrHE9BtLv+
	 /aWq8MzPF3+mScKk3EM0iovaOf6RkMGgeOv265jMuntlojLdfQB4Qpv4xg1f6CECAg
	 62udJlHcZTiq4WYezlr4S2HrEkEi8Of515lhBiZ3RVjF0UWVUW4tJ4N5vitRntRdSj
	 k7JtULNJN949UaHL45oSdzQAcBXqETd1kcPLWL6m/CKfWCX0WrTA4DzUvw7nacI3Lt
	 qxhuWOuPcc7eRXnYIgDHGJa0nUg3s61vaIJ9sSPC3QJjhRF1fCh5wtzT4S1QfIndVN
	 dc0uooeHkQzeg==
Date: Mon, 30 Jun 2025 17:09:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	y.oudjana@protonmail.com, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, mbrugger@suse.com, fshao@chromium.org,
	mandyjh.liu@mediatek.com, lihongbo22@huawei.com,
	ulf.hansson@linaro.org, wenst@chromium.org,
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [PATCH v1 11/13] dt-bindings: power: Add support for MT8196
 power controllers
Message-ID: <175132138645.3512206.17376450738040159326.robh@kernel.org>
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
 <20250623120154.109429-12-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120154.109429-12-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_150949_191498_B713A306 
X-CRM114-Status: GOOD (  11.13  )
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


On Mon, 23 Jun 2025 14:01:52 +0200, AngeloGioacchino Del Regno wrote:
> Add support for the power controllers found in the MediaTek MT8196
> Chromebook SoC.
> 
> This chip has three power controllers, two of which located in the
> SCP subsystems (where one can be directly controlled and the other
> can be controlled only through the HW Voter IP), and one located
> in the Multimedia HFRP subsystem, controllable only through the HW
> Voter IP.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../power/mediatek,power-controller.yaml      |  4 ++
>  .../dt-bindings/power/mediatek,mt8196-power.h | 58 +++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 include/dt-bindings/power/mediatek,mt8196-power.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


