Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224C3C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B7i/hQKzom5o0iybn5WcNcyLUjAjbq/CIl67BcioVU=; b=4Udy41tdMvy2LCrXosiSOxi+H+
	xISY13aNJQ9W+LpkTq9tpg7WDKvd3/6dsJZb3wTlcVoYfDOmX4iUu0urbRHS525vX02fA0tmvhTBx
	9PFUqNtyghgyaMTwN5EJSUPcZCpwC4UqCQYq8ohAmsjglhj5UdZtKkIP5MeJ8ZU8ztW7QIMsoKexl
	sMIXd2WwfY4w1sIARjQ6z5mh+U55gmi9FksOUNnvugNcNH6pV7QkohMUj9P0Tea8w9PwFn+aGT9N3
	21yl6k2cBt0vk7UPy5v8idJbuQna5/h0b72neKzrDJ8UXAzMcodp32azJ1rA/FkjVE3axDPfAthWD
	Vk3x1ykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFjp-00000006dpR-13Hf;
	Tue, 08 Jul 2025 21:20:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEYi-00000006SRc-0wFH;
	Tue, 08 Jul 2025 20:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9951D5C63F0;
	Tue,  8 Jul 2025 20:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C11CC4CEED;
	Tue,  8 Jul 2025 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752005095;
	bh=UAxdp1DGkpWzNRjNigWBfUd83bXcPNzljSWxeW6F6ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNSjpre9hQm11qlU7fwO/m5yuK6s++nUu913KGSodJ1VVbBXIqeDLnEui01mJtsLw
	 rpEL7rAhofOjBlC2nqbcCvhI7CEpbr09N/gy9P8T/h9b2qyXVLc++06Ao7a5lv2yoY
	 BVyJN9oN4tUu9wegJuCgyEqaxWaGjka3IiYOVh0kwM9BO0f/3ezO4lVPK4tg/luqyb
	 ZN+UBhGPaLnWpDAfWKTDr8qH33FTfMtUwcx8zRB7UE0CdqWhmguyr04jIRB4bUhItN
	 FJseQLrpgyIyHW1aPKEvTIbsHFg6W05WkaFkxbRlFVK79+vS2KB6SQSkNy0xeFUMgN
	 si8FA1sqFv9/Q==
Date: Tue, 8 Jul 2025 15:04:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org,
	mripard@kernel.org, linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
	quic_jesszhan@quicinc.com, tzimmermann@suse.de,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	nicolas.frattaroli@collabora.com, andyshrk@163.com,
	andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
	conor+dt@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH 05/13] dt-bindings: display: ili9881c: Add Bestar
 BSD1218-A101KL68 LCD panel
Message-ID: <175200509348.879110.17260989179996281641.robh@kernel.org>
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-6-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707164906.1445288-6-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_130456_299913_9DC0C5ED 
X-CRM114-Status: UNSURE (   8.66  )
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


On Mon, 07 Jul 2025 18:48:58 +0200, Heiko Stuebner wrote:
> Document the compatible value for Bestar BSD1218-A101KL68 LCD panels
> that are based around the ili9881c controller.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


