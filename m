Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B05C88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7iWgmkB5ua9FGwXPfjin/NDimCL+NiOGkzL1O6SrLo=; b=Xj9hRNzzrLg2zCEsKaTVdq8+/7
	0o+hLmd5sDb4KWkeiFyofDuYiJ4yKMvio251sQ1jWy3T2cwyKDCSEA+QC6PHH+mMjUKuCZXen6oQd
	kzvQyFBCUEK+77FFpJMqaDk+wN21DHvjTdZxhym1MG3ury+u+s1i3twUF6S9Eyda1u3rEU8A2s+bB
	WiJs/H+4mIjWr4FjTLXOa1Qyi0QNpYTnunqCl53A4wZ5b2ctm1oCm8/fDyq+sLHU3+yiDr9MLnnBV
	DHRJu4Sv1I+iD+FBZ4Ez/9+Phrvw3h9v5Y88wVzamSZ5r+NLO7OUcgvvdRt1rmc/XSTu6iwjKszMy
	U/5YBfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65OM-00000003SWh-0ib0;
	Mon, 14 Sep 2026 12:02:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65O8-00000003ST9-0KJ7;
	Mon, 14 Sep 2026 12:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789387338;
	bh=nrwqPCZkQIimnka60MFra6BC5Jik31pbN2PY4QrlaYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h5KI1TJ/E/gcDBfB4bNFcKVP9n8rcAPff+fNsd457fjS+8MhM3chYQW3ynEEhuBva
	 bsZS0djpQLU/cus5BHLBN8hYMyewO77dkBWzGHQtSqdP2iumHZLK0w/dQgtR+35mC6
	 D0+Y1QJJ1HKxDDyFN84rqiIb47XJUCisltvqUGvvNsDiD0rhOnietbTSig7ULNzmRn
	 yKMI8o5YbKuG1GDq8sEfasXOgSAgHrV/qQshWPRiFTQjbuD9YNIp9f/de8rTVdQW6K
	 9cLXKzLNSSmMXUaY1S3pEd7Lh0mUMxT83tC/u7JaOywePC3gRDj0MK3Sa//PHL4Jls
	 YlFva8qS8akZw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E959E17E0074;
	Mon, 14 Sep 2026 14:02:16 +0200 (CEST)
Message-ID: <ca3ec44c-710b-4812-9d22-c70003a136d3@collabora.com>
Date: Mon, 14 Sep 2026 14:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 08/24] scsi: ufs: mediatek: Add dual 0.9V supply
 support
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>,
 Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 "Martin K. Petersen" <mkp@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20260914-mt8196-ufs-v12-0-9279d7ef814d@collabora.com>
 <20260914-mt8196-ufs-v12-8-9279d7ef814d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914-mt8196-ufs-v12-8-9279d7ef814d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_050220_284622_D9705324 
X-CRM114-Status: UNSURE (   8.27  )
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

On 9/14/26 13:38, Louis-Alexis Eyraud wrote:
> The MT8196 SoC has an additional pin in comparison of the MT8183 SoC,
> that is used to feed the host controller with a 0.9V supply.
> 
> In preparation of this SoC support, add in platform data and
> driver the management a second optional 0.9V regulator named
> "avdd09-1".
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


