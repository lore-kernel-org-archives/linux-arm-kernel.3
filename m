Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3172FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 08:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MT40bLRnxx/RElUv5Sd2W2ft8Q6UMHBanswGWUleWBc=; b=gHWJIGJ9qQEpnlW60xfjSEN8nC
	ztQrIoA0acgzjhj7r78Zyu6Twm+MRYi3TekmAwaLi2qclxBeNyzcb2Vo8ZB6rImMRr1uPN3e2BZky
	CX4hgBiNyWa/oCmFVxt77PHURVtfvCnuAjlkSHGzW6I5DbEwset2HOVBmRq1qaqOoQWyI8igno1LE
	o0siTn46wFUdwoG28WUAXQVR6txD+IxRjSZ3AHmmzK7q6IwfhQEctY8w4mcOmixV5CiwFbiS1s49Y
	KUhAekaubA9KPzBgxJvcNqrYkp5+6VxO63DbGltLkSek/YNH8KdqfErU5UswXkoW/56fsQY31A+fb
	FWVVdjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHfI-000000082uK-13Ql;
	Sun, 22 Dec 2024 08:50:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHd8-000000082cu-21Ox
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 08:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EC83A406EB;
	Sun, 22 Dec 2024 08:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69CBEC4CECD;
	Sun, 22 Dec 2024 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734857285;
	bh=QiorQma68E6gCuJ+xks+0bz4YOMbtbMbQiLIWs8dXkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByUiXJ0eCep3AWjx57Q4i43W/YdXCykCwND9QYUzphczBPvD8AheXgC7yZWLSj+Rc
	 ZI6Oyrc0//YGJ2U4cJSocRmt6n0vA8aw2oOFu9JkGdawpoEQu7IN22gT4J76LhDQTY
	 cX7KO37xFtOoe+ZzKCR/JPydrj41vd63A0uycz6gQruIVuuvbqGD+We50hMkIPq+9M
	 jhDRwIYeYL9WvUG+2Fq/Qv07KeJIMVaV41hpHuLVqkmUNvL3DU+2ntdhyM3+IEQNC2
	 b+rW3pfwqzslOANOwqGJQ1BtAsOo0otn3O18oEpQJN9/EXMbzAfz4qF/gwkDZp0MeN
	 Qg7ZWxHhVys3Q==
Date: Sun, 22 Dec 2024 09:48:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Subject: Re: [PATCH v5 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
Message-ID: <edoc2enbb4ch3r7nb5b5jykm6f7aqbktqnj5ytke2b5fa5bcgv@ceinrartc3gn>
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
 <20241220-gs101-acpm-v5-1-4f26b7fb3f5f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-gs101-acpm-v5-1-4f26b7fb3f5f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_004806_586934_722F6D9B 
X-CRM114-Status: UNSURE (   7.57  )
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

On Fri, Dec 20, 2024 at 02:32:51PM +0000, Tudor Ambarus wrote:
> Add bindings for the Samsung Exynos ACPM mailbox protocol.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


