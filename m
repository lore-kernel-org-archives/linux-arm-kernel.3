Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDE5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9TrYMjgYebm6KWIWcjYqtWR2XfIR95CuTK3iPlv5r4=; b=4rj3y2AKmlJmu0/uYNYpAA6iZD
	O3XPkJdCVLFObjFqd1bFHRPtkwx+ORNbaLoAmGF0Obipu8lqtOMPGC/4VLuH3D7/LygeRacmglSWv
	2tJvnPy+mhDNvVt0BE7FXDRtI0fp3+XxcifzMUYQ96YXsggt7aDOdkH2MfnZlfNJlCHDCyp2Hwn4x
	VNYwKUlu/eVPVWsR/wduNYc3ETAxgTD0VxqaWPBEJlkFzuJXQLa5wdbiHgtffnQ27Ex2rdZja4V+9
	k8Ztpmi/J046aSczY+eErB4+RCUSmr9P8vn9cyhGTOtZVk8f1XxrDq5pWNJTYuEbZMOae8quky3eQ
	q/gs66+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejXJ-00000006D8V-49kB;
	Thu, 24 Jul 2025 00:10:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejAF-00000006AtZ-3IF6;
	Wed, 23 Jul 2025 23:46:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 429B24585B;
	Wed, 23 Jul 2025 23:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525B2C4CEE7;
	Wed, 23 Jul 2025 23:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753314381;
	bh=L9TrYMjgYebm6KWIWcjYqtWR2XfIR95CuTK3iPlv5r4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i1K9qzH7DG2h+g1yZsEjaOVZzigH1fChupHxonmAIx7JGqhCu+z87XlBnVEupXEt6
	 KSqkbGRpnDxmrhXtnF1dcFlSHwR1cn5ToYnTcU2qtx8pk7v85TdPm10X605v4xe17R
	 wpbUeQu7mCREt74xv0h5FygWr++g81Wpj85SOxBpjOmSJb251GcTyhRdonSQSdj3JI
	 W7of1EJ+hb2S3xA6dWqjuH+45NyOpujnCTIPius9sxbeG/NSDlnyQztLfic65oghnN
	 4TCL++mWSgE9usLvZUw6/KW0T9ZQpTwet84KvfyjPT3ptHhE9tlUoBWJTBc3AvBXUO
	 fSVFmBk159VXw==
Date: Wed, 23 Jul 2025 16:46:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sanjay Suthar <sanjaysuthar661996@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 ribalda@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML
 docs
Message-ID: <20250723164619.303f1dcd@kernel.org>
In-Reply-To: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_164623_854732_8715AECD 
X-CRM114-Status: UNSURE (   5.14  )
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

On Tue, 22 Jul 2025 22:35:13 +0530 Sanjay Suthar wrote:
> - net/amlogic,meson-dwmac.yaml

Acked-by: Jakub Kicinski <kuba@kernel.org>

