Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2146BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsAm3hgretgE1AHA0EPoC7xGwY7JknqcrHTBLFe2GAc=; b=de6R9VdQ90MDxCyX2y97ssoxqJ
	94zMOSVbuFa39nojcfemZuBSkRyhd91havvCcmL9bSd+ZKcQulzwB2aYW+WxzO7OAKhViG2jZE46Y
	vaHm2KYQJTg+vmAhm1GQxoL+8ZRKbbkpU1zfTe9kJHmW7s5Zfn3NPkK/G6kQK2p6ZzGjLnTBNRbJN
	YoHOMlT8n//+7rtJL9dWf8uP/SUax/96gIVrX01nv8ayQmCoqUe2gPJG2ObkDC88sVoP2i+Z2sLMq
	nkp2lvFwb6WvVhkaxk9ieimNnU1jb90vpufZ2rG1JXAHipKLRNYNk87EmfMfIE3zTI7rth52rNt0/
	7hltL7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWgk-00000005yhW-21Vg;
	Tue, 18 Mar 2025 13:08:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWUI-00000005woM-2VWt;
	Tue, 18 Mar 2025 12:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742302564;
	bh=k1Jp1mQaKJe4wzy29NeaR9bYOOUp/GPWqEzK0Vc9Hyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bcBn6h3xCRIi5pCJkDWemJFu65FyuQJwyIh+MC77sWCpsO/D+OzzBM/oB72QFylVw
	 VMwmVFegCRy7z60JeRjtbBjwGHucX2qEYOHPeon2cIQXDwdw25mJOaR45jjMV3CkcB
	 NYDbhvazd64GN6tpV2A54et5pXRQ7fcMu38gWz21/8KvSIorZN5VoQEXHIIehoEAr6
	 2sKMrsDCfkmpjUDFk+eTqTvMzTWaKFegeaQcRETqu74pnOxhDKmT09kKl/iTAZFhgN
	 0FaOOhdJOZZknMIne1OKgxYXEKhrDtgQ1vJe9vZo9zneE8SxY6pWLofJsRkaoeq3yR
	 b30d/0a0klw3A==
Received: from [192.168.1.90] (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A07617E0385;
	Tue, 18 Mar 2025 13:56:04 +0100 (CET)
Message-ID: <eafe83e6-c18a-4d1d-841d-8d2472a670e7@collabora.com>
Date: Tue, 18 Mar 2025 14:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] phy: rockchip: samsung-hdptx: Add high color
 depth management
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>,
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
 <20250308-phy-sam-hdptx-bpc-v5-12-35087287f9d1@collabora.com>
 <CAA8EJppo29p+8a5VUbr6dwaE9ywgS+-VcuUH_sF+NdA0xGU1Zw@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAA8EJppo29p+8a5VUbr6dwaE9ywgS+-VcuUH_sF+NdA0xGU1Zw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_055606_809360_F0F7FFA2 
X-CRM114-Status: UNSURE (   9.47  )
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

On 3/9/25 12:18 PM, Dmitry Baryshkov wrote:
> On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> Add support for 8-bit, 10-bit, 12-bit and 16-bit color depth setup.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 23 ++++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmtiry.baryshkov@linaro.org>

There's a typo in the email address, I've corrected it in v6.
 


