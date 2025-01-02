Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E37E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2+bOSy4ihYtaEUxgdir0vk1PfawRZvKNvwhoAkZDoE=; b=zAb5eUpy6IQDD0fMu7R6aN/VSJ
	Gqe7aLNTHtK+0Pd2q/sJSbiAIOIyQoecwBs1eM0GMkyNhXOXnmo/iHs/zA3euZIuvXKHFzniC7a/1
	Q/hGg1l7qpQS6q3vCkLxX7eM8jqFClxOyB+HzZcbZocUcDr4jO6A7h7rFLGd8vOtt45cq5Ni6vClF
	Yez6TgbL+25ZunQmSMWINJJubb1s1h+5hJkprv4a5W3Za8s9l2VzhoLs7ktV0oanNY/oBx3BNkohR
	afF6iQ8KEIZD4/Xq25ebEZ0Cq02LvzNHGuz8iUI+ZBPe+POZ4y9eR+n0uKt1S9vicpRcKHccYF+5V
	ggQRMUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIVu-0000000A9i1-3M67;
	Thu, 02 Jan 2025 10:33:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIOz-0000000A8at-3yfB;
	Thu, 02 Jan 2025 10:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735813564;
	bh=3GT0ivpU3yT9AFjZTEHywkw0fqTG8Qo34fH2ZWvQSrE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FdBsD+9P380hWkNn9bHXbcDSUudBTfYl1d1kX+tSRZpea+eqZiieF9N6pYkDqhmek
	 2J343vp5xN+VyV72GslwlXzLbUAORXEF+XYf61+JrbIiPTT7rtb9iTE2HiW/01m8+x
	 +LloVK0m9x6TdXOy0hYEnuVwjersrzRAk9hXwBa5Mkar/cP+FglQq8t3fJNHK3LUFf
	 IuxpklkXQvkxoEHyij8MFPg5eHIRnhSYGtFhvlfxEYliu1mEv5t0GriA3z8Iz4gctp
	 btj6Hot9wx7BHDpaGyKBhWEt7PHCtFt4C/eyjqcQ0f8px2Oc4Ia1RxYAuoeHT7QK7I
	 iGSNOnhfLDL3g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 33D5317E1554;
	Thu,  2 Jan 2025 11:26:03 +0100 (CET)
Message-ID: <61df483d-76ae-4974-8410-4888d89a5f3f@collabora.com>
Date: Thu, 2 Jan 2025 11:25:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: regulator: add support for MT6392
To: Val Packett <val@packett.cool>
Cc: Fabien Parent <parent.f@gmail.com>, Rob Herring <robh@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20241226050205.30241-1-val@packett.cool>
 <20241226050205.30241-3-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241226050205.30241-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_022606_171237_A7749FBE 
X-CRM114-Status: UNSURE (   7.74  )
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

Il 26/12/24 05:58, Val Packett ha scritto:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add binding documentation of the regulator for MT6392 SoCs.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



