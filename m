Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34243D65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOmmSPqwvrMane0VDjw1J57j9KssTwl7LT/TZJ/NpNk=; b=yEKQ5/k+Syja9r6I1iSdttEy8b
	IOqqNoLxkon61pmtM+An1ecXwyijTV56PTvm5XxLiYuAsMZdkiEk1Qe6RrQBkGVI9VOVqBo2sHeXU
	euB8t3xJHkaRyaIVEprNCS7zPFaUOjkUSd8A+CUDFp7uQA1LUTt/k2/lyBm+WL58Nen9EDMjhwGNu
	xhTeSmXm6cGaHWr3qbXxLFbLDmWvStrlw+S1ZWJDR/Z5rGIR8ItPxPw//4ShtxLjW/XtWCj2+X0nX
	sHmsiIdTf7sb7nOU+6IK8qOrQZ2tA+YTUnkbU6eyc3xGBUmkSrTvZRTcIPL3hH2h78i6rR8PhAPie
	yOksv2rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYD2-00000009lIH-0juY;
	Thu, 14 Nov 2024 11:40:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXDl-00000009ZFX-3qRI;
	Thu, 14 Nov 2024 10:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731580624;
	bh=aLsZjA2n5qBFWKwV+QQGM/W8zsubVjefSPXaeUYJ6nE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MZ8PMwaUwWCHjh+bqwUoeNZUvuxw0kYBeT8BG7DuQpIZuQjiPIz04S3Fh9nTmmXoH
	 BA8ZPRin4DJ1gbeQwcH1rBby6MyGZBV8I7J53HSMErzdtQ9D/KXzI6XIp5XPnDkycm
	 qcSLuboGD5XZZlh0zkzvJgkmI6fkyxbNJDB13AamYjOr2wWHiytgkbzQMmsuo9N55A
	 NBJPXx1cg+TN5rB/Q8WzpVr3pfjqcDIGEkq4fxfTcxXd1Y4mj5hMAxykB/vVW5djme
	 l/spAntWdVWmFMMIlVcQIZkDvlRBHK3ykQe6m1WUjEypE7rRUAqEaHVlV5/+ZHDwr3
	 u/nxPsRLwFi0g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 792B317E35FF;
	Thu, 14 Nov 2024 11:37:03 +0100 (CET)
Message-ID: <654b951c-1c69-485a-88dc-0c662172ac74@collabora.com>
Date: Thu, 14 Nov 2024 11:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/7] of: base: Add
 for_each_child_of_node_with_prefix()
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106093335.1582205-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_023706_157799_FD55D3E2 
X-CRM114-Status: UNSURE (   7.83  )
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

Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> There are cases where drivers would go through child device nodes and
> operate on only the ones whose node name starts with a given prefix.
> 
> Provide a helper for these users. This will mainly be used in a
> subsequent patch that implements a hardware component prober for I2C
> busses.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



