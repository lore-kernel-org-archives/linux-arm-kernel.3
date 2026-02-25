Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B5FFD3760
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGYL5PjOEPbwUaDq1z3K2LmetQQqT1ShXR1KX+ml8yE=; b=aWIBidglbgz8wp9nMvXClf3hUZ
	Q2WUC0CEkkHCfJ7NmzSMw1X8rppk8oP5EqyMjnGvNMQXvhJ1PmssDaCIggldLgtrjzKaD0nwrYmfP
	j0ynwadIg0PCcutjh1UoXF0fFiSPJ5C40XLKhLnZBZn3gSCBNo+5PnXN6vBx/zUW1hyww8I4HRstW
	/+mNBZS4fM2k87G+y2AHW3NXKqVi+MLBX1Z9I1yAsz72raZXKwjwPT2ECVzbxWJXeVULwn+MOJ5ah
	n1j9YduHjVD9ydR7mmCws2eaiSbfJdBKLyf+zP8XN4gsLu0cwAY2jCARyYkSQs+DQuV4RdgnQtL93
	4zgYwtlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhS-000000043BU-1uMJ;
	Wed, 25 Feb 2026 13:13:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhN-0000000436m-1UKC;
	Wed, 25 Feb 2026 13:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772025182;
	bh=0OYJVrGzHeHo71a4qjaYHaB5i/Wxv/lLqWp9M+WtRQg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R0B2OzV4iRgrFJQjaLeW5PqN6rUJwdVlMdClTqJAsv6M/rxxo0azL9WyzH93S9Is0
	 NKvkhvKlnRsItAQUfsir2NCy2hpOApMWL4oUT8aGxq0OQATkusUUYKgale9jafnHJM
	 4JqRr/FWoyL9D01gR9nNiU5zPvav/HrCEZVfsUQie4AdWNDW90Yz7N4sIJnf+mw1ta
	 OCnas86JWDlIv4+oVv5nVfXn7BFjPuKVELcFEFZQqxtDwjl3qFp525lutQ7Kz9ndpx
	 EPIA0Eaolzl3f6bge3euMAuayNJTE76tpK6Fhqwo8XDTa5LWNsl1ncwFylC6qT+BUv
	 QhGEw1ii3tSbw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D136917E0D8E;
	Wed, 25 Feb 2026 14:13:01 +0100 (CET)
Message-ID: <ce5899b6-1b88-4212-9e61-edd80c5b8c3a@collabora.com>
Date: Wed, 25 Feb 2026 14:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] PCI: mediatek-gen3: Disable device if further setup
 fails
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260225072225.3345307-1-wenst@chromium.org>
 <20260225072225.3345307-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260225072225.3345307-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_051305_567158_BF56F538 
X-CRM114-Status: UNSURE (   8.76  )
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

Il 25/02/26 08:22, Chen-Yu Tsai ha scritto:
> If further setup fails after the device is powered on and link training
> succeeds, we want to place the device back in a quiescence state to
> avoid unintended activity and save power. This also helps with power
> state tracking and balancing once pwrctrl API is integrated.
> 
> Power down the device in the error paths of mtk_pcie_startup_port() and
> mtk_pcie_setup().
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


