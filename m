Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88DEC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 07:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYuTlJTNqGuChiWRZlkWK8atqwHx0Y2lUOhTbN22Un8=; b=m6u6nyfh7kN3f9NVOOJTQE3weJ
	MtqTpCeW1zLwA9AXL9/d7WkO/1l1jxeXUwxh3FS3/HwnYrW5U3kQ4TACo764p38b1TfuP9OEg2vXH
	KChCKoFYGwYfvfri95wf4G/1EeuWC/DMrVll/AZfMNq00uX7dOzYTNm+CknY2ZwRx9/Qkfxqo7Hwz
	4HPpcJuiBsVvbi//luuOvuREUo5IQIItCDgeVTZq/ZDFFjkfcjTTRjeGrpqVDbdgIsfTF3uj3cEec
	Iyfr9+q1wDjJZb7DZdf6S9EsCWhqpZg2ElEoE4bmMtxu5fjp2691DeKaalhJtUNztZKwuNPglENWa
	uIHfwY5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW928-00000001SeU-2umk;
	Mon, 30 Jun 2025 07:34:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8xt-00000001Rsy-2GiR;
	Mon, 30 Jun 2025 07:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751268607;
	bh=h3+BbSsRzFSbCWdeIHhuw9v25Gxev7MQWBIq8T/6F3k=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=aa0jE+HDyg7qAOkBA0l+7XGeqlGtp7ZiPTI9HCT25cmM/J6GI2hCOV0v7C3yzx2Mh
	 LktFuM+PfqaeYwQ5w5AlUmTsGn1gbfFJbW20fCLVTh0noO/PbrFR5EkTMtmvAsDv29
	 8SY3mOGCS6KysPRAmRCSRLredMiOf+A09CotRf2oZS3dVvOk9byVdoHBL5iqep81sj
	 pJAvSoXW+KrExpONnWGBf87BH1W7mkcGtnRSTniqmVZ6vxf0+kWoIXX4ZxAhcT7HCP
	 r6y03zs6ta3j10t8n2mn1SkkAvxFtjNdUOqisLPQ1Oni8flReaK41SSWGE2kOal/uJ
	 oMlQNW1iQ+gWQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D461217E0B0D;
	Mon, 30 Jun 2025 09:30:06 +0200 (CEST)
Message-ID: <ef28bb5d-8d5b-4505-8b00-56c9e5abd90d@collabora.com>
Date: Mon, 30 Jun 2025 09:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: iio: adc: Add support for MT7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, zhiyong.tao@mediatek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250628223837.848244-1-olek2@wp.pl>
 <20250628223837.848244-4-olek2@wp.pl>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250628223837.848244-4-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_003009_731715_9F1B09FB 
X-CRM114-Status: UNSURE (   6.99  )
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

Il 29/06/25 00:38, Aleksander Jan Bajkowski ha scritto:
> The temperature sensor in the MT7981 is same as in the MT7986.
> Add compatible string for mt7981.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



