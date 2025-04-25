Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69F1C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAUVLahP3g/MVtZbnTbpZXr+mslUpqcmHR98NsFw+W8=; b=dJf/uwiP5Zq0rikDxrTooJpgTw
	hwuDEUVG1DY6VbBIqEPb465CMY3zfjV5iOssmcyDEwQdz5CBrBpWn0CKnSIx0YAhPkaH6gusb3EnX
	myLcY7nY5luQJoA1Vnj/5u1nPnvsYEqVZQG46dK+cIKKJfl+RxRGg4GiXErRYjofDlAqOdmtkXWE9
	nY5r2+mG4tFClt1bcyEQ4mCrVMKbl3wBigVml9+JNcL+hzulkWYoXnvm07ZZUa04r9cBIv0R9LbNa
	B4/2pXgmiX1lHX8MCzWODXOQV/Bw46AuHsK3ja7KUKSbUCfrFEAA4AV8/7062wPw+P5msCDmHtuKX
	ku5ZxMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88ka-0000000Fm9p-0QjF;
	Fri, 25 Apr 2025 02:25:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88gS-0000000Fljh-2zJF;
	Fri, 25 Apr 2025 02:20:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4AB70A4BD21;
	Fri, 25 Apr 2025 02:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24A5C4CEEB;
	Fri, 25 Apr 2025 02:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745547655;
	bh=vjhWnE+yweRc5pNFfcwxO1w2ynyuzXYUEPFlulFeJ2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFuKctuTRC/wLg2WplGSQaP3gn0tPb1bIpva9sc7+v5tf5gi9XbehbR9D9Hyu+NG8
	 3FGiJSvA7lbYEqpCNJJka2LngmB+muAaZwoCxKOmvUH1dGRd7Q0WhDAfbETuwzA91G
	 Rb7zTo3fH+zlvnj6AjFBsZP4kvTppCOQE9jLwhmg4pPYX2BOOP7/F0vISy2SznbRGV
	 YEBq5X/rw1b31LpFU6khV8CEnNagoBDz8apMe4zf6QI20rNXIPM9N4A7l50HlUaL/8
	 1FZS8P9m+pSifbhUT4bt0OvBdLWjaukoFkYLXRlSl+DcXScZPDGk0mVgIgBTAlNBv9
	 9jnG8QCTAVk2A==
Date: Fri, 25 Apr 2025 02:20:50 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: (subset) [PATCH v2 0/8] arm64: mediatek: mt8186-corsola:
 Consolidate and add new devices
Message-ID: <aArxgrBkFvHwr_Gj@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_192056_817536_7CA9281F 
X-CRM114-Status: UNSURE (   9.78  )
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

On Mon, Apr 21, 2025 at 06:12:38PM +0800, Chen-Yu Tsai wrote:
> This is v2 of my "component probe for Corsola devices" series.
> 
> Changes since v1:
> - Reworded commit message for Elan I2C-HID binding change
> - Dropped I2C address constraint from Elan I2C-HID binding completely
> - Dropped enum from new compatible string entry in Elan I2C-HID binding
> - Picked up Rob's ack on two binding changes
> - Rebased onto next-20250417, resolving conflicts with "spherion
>   component prober" changes
> - Link to v1:
>   https://lore.kernel.org/all/20250312104344.3084425-1-wenst@chromium.org/
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[7/8] platform/chrome: of_hw_prober: Support trackpad probing on Corsola family
      commit: 73d32c3e74e1bd679617b9b9c06d806dedd7c055
[8/8] platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
      commit: fb8bfb48a4d11efb9b3e492d7c5e9ae7478786ce

Thanks!

