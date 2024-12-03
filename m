Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1E5E6C61E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7GWdamB5WdCrjq/M+x+zZXGyV6W1qS73t1sR0Cp6y4=; b=I+zsrndmXvvpay0rVYUMGnCVCf
	rU6aT2P2gcUMwg/IeytYu3l/YHQzhJJJ9wQzHcoROknOf/mCSEZDD78Lg2d4VFyMe2NMOIjXYj49w
	l/zCtVSH1VIHTykdb2rmz04cStnQjkkq+Xgts9cLjDuZOj+maTj+bgjSNLsQwrheJv7JkHn0FLmbm
	AgPQ9c1PPVEjkeYicJIQZLPdtfIohXGtMdYLmMt2reFrDa7Qp97TC/r+2RVM1LW9QrCJEC863Q+1d
	eFoEZbdoo0vs9plDtYqSjEtzTYSbpSbTgyUpBCVS6/lDUH5vaYscFJ82mI5tY7GQIgZ6C+Hai3LOi
	Ax9eHxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOvY-00000008oou-3f29;
	Tue, 03 Dec 2024 09:10:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOuO-00000008oVY-0fMJ;
	Tue, 03 Dec 2024 09:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733216966;
	bh=UtWpH2fdy+acOk5t/z7lYvrwvuCHIyhnPop+Man7z7o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Aok64XPcQJtNbWjX+v7/EafRr5VCbWe6grhQT33Y98fB5AKXaRJCZciDDfSnLxZN8
	 A2fh80J3qCzmKT+6XK2bCHiqOwAljCjBBdAz9pvj7NdzAqB3dpIhjb7ddnydpVUTc7
	 FqgQ3KmlSic4PPcGoNtk4lqnCV002zNaogJ0sKRVwZs6CX5egEgFangI5aCON8/0d1
	 alYPvI7tVc5tW7MilRoH1xd/xKHzIY3CviXE3Ts/2XGvvOH+9KncLmxk8N74Cob5Fz
	 +sVGGLXkVmDDM3NUtPQpaUL8dyKh3xkBx8ydxTTM3FsbvILfcgnFWUGoFTXg9ngKmn
	 MgX9jnmyO/RVQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B666B17E14EA;
	Tue,  3 Dec 2024 10:09:25 +0100 (CET)
Message-ID: <d640a13e-fa08-408f-82ac-fc169e2eb283@collabora.com>
Date: Tue, 3 Dec 2024 10:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: mediatek: Modify audio codec name for
 pmic
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, wenst@chromium.org, hsinyi@chromium.org,
 sean.wang@mediatek.com, dianders@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20241202032035.29045-5-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202032035.29045-5-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_010928_350476_50610594 
X-CRM114-Status: UNSURE (   5.27  )
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

Il 02/12/24 04:20, Zhengqiao Xia ha scritto:
> change `codec` in pmic (in mt8186-corsola.dtsi) to `audio-codec`
> 
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



