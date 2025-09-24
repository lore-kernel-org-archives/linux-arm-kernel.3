Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C80BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNTSBR+33CfO7C38TvNl8drxgj6xqRUCOvm8na8Km50=; b=rpTBfycBb2Zyw4FWRkuvD/7eii
	0cWGNr+zmafafaZX9ozLXWGYQQhtsMdQ5+8vrPR+XGa4FIwK+WJH5JV7B8J5MJ0pITVveeKGlanGY
	PK0GWmxs5jxiTjahp9ZNUlPPejIWBxZiymUYK4NglmdOzqY+Tv/SGQ45Q7fbPTkJ+ur4X4Os0T31N
	zSbjsYtXmfwg/tGBn4M736Omwck7zaMbeASvAaXXqoJwND1HiyEF/54JRORCM8oIS3gWaQ5u4yePM
	vmmAEHjMSvLkRQe2xkMyhlaILZps+3JCHtEyIjIlLgwrlA9ZlaXGZWiVM+40I7cR2Cy9KihmtFbBi
	EzwiukXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MUN-0000000GNzK-2UrQ;
	Wed, 24 Sep 2025 10:12:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MUL-0000000GNvm-1c9u;
	Wed, 24 Sep 2025 10:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758708757;
	bh=D5SpqLgtg8TrRXmvvRrz2Dlx97l0sLSkeQdtgoGX5SI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VMRVlyzUSQQ6kE9AdX4G3M8k1NdpJI3ti4OtMIMbU5YjZTZRFVE3fK3u9dYAJsWKm
	 KTDi3BHax89UW6IWma1FtBPrvF1JfBjAk5ppvRXsqsK9Srd+rPB8g5AhKFpgVFE4hh
	 Va1pk326vbWltn7cQG1WfchiRGBNZNSii0YRlp/xJ6sF5SLPAaAwHQEH8OmiqnKpGp
	 My5v2lbNgBhZIpGAxnjE9cBy6nwjFvkZo7VANX22HaOfvONB3TPUQqeFVK+CCL6xPK
	 QE+bsP4EReA0eLin783kd3yTi9GbfYORJ3zNeutH6qWSPZEr8czkMZs6NjXe/h8GxG
	 GP/DeF1tVKs9w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40F0E17E12A7;
	Wed, 24 Sep 2025 12:12:37 +0200 (CEST)
Message-ID: <30a75332-a7f9-41ed-a4e8-520b1e7c9bfe@collabora.com>
Date: Wed, 24 Sep 2025 12:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remoteproc: mediatek: Support MT8189 SCP
To: Huayu Zong <huayu.zong@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250924084422.4604-1-huayu.zong@mediatek.com>
 <20250924084422.4604-3-huayu.zong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924084422.4604-3-huayu.zong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_031241_733911_F8B4D64D 
X-CRM114-Status: UNSURE (   8.96  )
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

Il 24/09/25 10:44, Huayu Zong ha scritto:
> Add SCP support for mt8189.
> 

Please split this in at least two commits, with the last one adding only the
MT8189 platform data and compatible.

Also, please clearly describe the new scp_secure_domain_reg write, as the current
comment is not clear at all.

Anyway - the code looks good overall.

Cheers,
Angelo

> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>

