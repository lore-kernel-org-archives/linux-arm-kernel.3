Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C116ACD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT1mqdalqKEFERjXioR70htLpWSn1twOU3jLBgKcntQ=; b=rdJottNoyhghzYtGQsbS5EPKjy
	psygMhO8VTUA559FX5zO79ujhUQVuuSbiBt1zr87aIU6UbqDcuE4MTUn4qWVTpmmwN2Ad80l1OTxM
	LkhPEZcMAb4jnSyBFcNuTUVhMPTaua2ESKX8fdAmveynDmcT0UdiMLN9SU+jlLtof5S/tVg1KzKQt
	znSPkY+OiLa+HUdinYGstRIkL2+l53dgNZDadyg7v5h6dAOVNQ/YK9RA5Hvs7HMDRvqrwX9HIUM/S
	AfIZK4dINGvBYEiTyavF/QHNpbo/quVQVJyzV6ntR6KEFz88LXf6rUIsAZ7AKAa1whd6kSsFnuEWD
	nwFPMBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWucZ-00000005RPw-2WCx;
	Tue, 09 Jun 2026 11:27:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWucW-00000005RPT-3jeL;
	Tue, 09 Jun 2026 11:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781004464;
	bh=kDv91ds4RRw7jDsLDr1dJGwzeePl3PFfqMDf8pBPUTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D8Q/4cAnBb636mJp/rWkgQ8pZ98IcXnzsIKdXeKU2lQ9JqUnOyXKD3dmAa47QHGY/
	 FN+HHIvif5CfxZGJTSXpslsQA85RUwXVEqP2QzKcxxRQu5/wJhX/BmPXzg6ouJC4f3
	 EH07ft1IiGBIUXKsSmc9ycP929k7mJPkqQALc9XmA6Xtk4StFBhwiLZdH2K0uwdJpr
	 sCOVrIq/5Joit4Wr8vg9K1HFk2LZFRehub5YqhWFXrKKpNA5rMq+FUaJRGfYxx+lOw
	 k0kspQW75Ry4+83mChbQVhLhHSRLEqhc4qyUZhFEf/mjqsM1JVmR0Ll7Fu8IPznNQs
	 NRZcvOnUWbirg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3AB3B17E05B8;
	Tue,  9 Jun 2026 13:27:44 +0200 (CEST)
Message-ID: <7625fbc6-317f-4f2e-b9a8-65db81ed4584@collabora.com>
Date: Tue, 9 Jun 2026 13:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: mt6359: Fix vbbck default internal supply name
To: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260609083630.1600070-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260609083630.1600070-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_042749_118474_ABE831F8 
X-CRM114-Status: GOOD (  10.60  )
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

On 6/9/26 10:36, Chen-Yu Tsai wrote:
> This issue was pointed out by Sashiko.
> 
> vbbck is fed internally from vio18. For the MT6359, the default supply
> name was incorrectly set as "VIO18", instead of the supply's default
> "VIO18". In practice this still works, but it causes the regulator
> description copy and replace to always happen. For the MT6359P the
> name is correct.
> 
> Fix the supply name for MT6359 so that both instances are the same and
> correct. Also copy the comment about the internal supply from the MT6359
> list to the MT6359P list.
> 
> Fixes: 10be8fc1d534 ("regulator: mt6359: Add regulator supply names")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


