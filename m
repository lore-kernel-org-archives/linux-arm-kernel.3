Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2721ED6DDF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9lydVQdIiYbJnBrPMdB4jm+Ggb897AKGQSLV+ava4U=; b=MEn9hPshCmk/EoUlP0dzEkGe92
	u5fgsh8GO2AdZ6IKDtF8GiJuFFFnf99dnlOghY4h2Cf9x9m+NCe8Y+sjV7c42SgOuFrWWbLxGi8+q
	eXbmGES5Cdnv0iB4TBLU8dDGBdt8f7cIS6qQfQaUQE4hVgxqyjCF1iHf/9ZgN/pr3GApICzGoqsXB
	8OofR9VNQNGOikGASr3G5Y3uJb/pO3Fl+Ymaa7E9ONyJyC6sIIODRVl0//CFkgiTdUcnp9ePt3VJ2
	B9ksrE3d6h7uZbPNAOk3dr2zlD23QQW4z7Kqgfsae7ZFY2YqZqjIPYxduQ4sMMKLQqCsKTJaCri8e
	SvG7/HJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvVq-00000008YN0-0DmZ;
	Mon, 18 Nov 2024 06:45:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvUq-00000008YGw-3NMK;
	Mon, 18 Nov 2024 06:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731912267;
	bh=v8sWRHTsKkaIXp7ryS23jcrKJ4KbPd8QHBLvwRGYRBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UaVJaDwnAywiJoSPyNOgQwrN1wSc4pSz07TNlzDdluUFLwNqCDUVxCieKnG3omz/i
	 dM6elbVWs2gAcWK7ulZzLanAIDQr4b4SZ6UP0Wrph/MhhJNIo7nP+IQ8uhf5LMRyH2
	 pBUe8H58xtkpQmUyWSzFASNdoM3hkxg81Y6qDoGVjyX57BbnhhMbH89pluxnttIh7w
	 Ca7+g0ZvwRNHSqTPoJBp1ZrEHtleDhy1bHhJnQth48S291Aabyz9ioWYd+nKSFh+is
	 tNvu75YDOg4oejfcgQvnCeb+t/yxHPeEeEJo6unyzByw+9VyDuLaIRHNlZKUY7CpaX
	 xbSW3Bw4fq2Gw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0817A17E1227;
	Mon, 18 Nov 2024 07:44:27 +0100 (CET)
Message-ID: <fa0796d0-dbdf-46b3-aca8-20002e820360@collabora.com>
Date: Mon, 18 Nov 2024 07:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gnss: mtk: Simplify return variables in mtk_set_active
 and mtk_set_standby
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Johan Hovold
 <johan@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241117052501.1138926-1-iwamatsu@nigauri.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241117052501.1138926-1-iwamatsu@nigauri.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_224429_013706_8E2CC567 
X-CRM114-Status: UNSURE (   5.36  )
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

Il 17/11/24 06:25, Nobuhiro Iwamatsu ha scritto:
> Simply return directly instead of assign the return value.
> 
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



