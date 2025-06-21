Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAABC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 16:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3lJ5xndn8SrhMsapPehkpoYdCrIv7+1ST7TAYdYpG0=; b=0z8aNXe4C+kaPhzhx0jYiMcQaa
	tiUfNRQslnuOK+Tnx2aYfxmFrBdKlzHKx0ravDL/EvrRjdcfycmBsesHvGNH8dhwYToqeQHnGQwRZ
	TYDMWLSSw1CR7yACcQEgk1JlKOGuFzVDOm04WvJcRsY9vClGPyTDkmbLT6uPU56xdI2YTrAnH6DlT
	p1ohVNXFZ7SGvqrP1s8MPzrHt8f+drohoDLzDXPsOJmCHP+4kx6nI3VVAp03iazvTgTpNVlZATMc4
	xT4Ag8nXgIDvIzn5+fBVhCfK3ZQT1in37dlOtspmWyeawn+TuRbXFZh9/YnB+BS6KZTTd14+32YgQ
	BgqnrwPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT0jV-000000000g0-3u2W;
	Sat, 21 Jun 2025 16:06:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT0hA-000000000Vv-1PAn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 16:03:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7BF36A4EA6C;
	Sat, 21 Jun 2025 16:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37C1C4CEE7;
	Sat, 21 Jun 2025 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750521835;
	bh=fK0szu7oKlcx4ykmNjXo08CHT5AcRlE5UnCS2Rd0ivU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u+fEWf3JpwaQFvkurB2cj92/djRgmEnGIJEl/mdWXIDbOTH6jDwNn+smq87gvEsye
	 AHgqB+9DY9lSohUc8SQeXlqHSMdQx+vXQzyGbvLvCVQgfTqH8+y3Bky1JitoAOr/8d
	 vikt6nrEmTk7LevSkyKPD4S/C+UQi++L8dBwQzFJGhBXZzM6y0k1KvOQqw4hjvdgo2
	 /mpgXcomEDj5y/vOKWA1fHDoQcQH2dEZN2C9tm+lCX/en02EmtVDx8tCXP9o2GAdXG
	 BeG7V07ritbMdx/ZOP7zS9wNpTlqdOt7VpBnlpJgtqG83FrdoZ0GfD6t+aLV9c9ydg
	 0TmmFq8UUK0pw==
Message-ID: <5e0a5cac-b88b-4721-a516-b179f9cfd3a0@kernel.org>
Date: Sat, 21 Jun 2025 18:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: Add Apple SoC GPU
To: fnkl.kernel@gmail.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
 <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_090356_440162_4B917837 
X-CRM114-Status: UNSURE (   6.02  )
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

On 13.06.25 23:17, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add bindings for the GPU present in Apple SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven


