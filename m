Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88919C3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLARB3VVMnLhhO7SX1RPLRUEfZFSkC+jp5OVl5jlf5E=; b=fRcExv1f7Z+mMfGjasX4w41ChO
	nlhzOmJU7v8MgLliuGTHOYai5gjXk0QHdp1+ZvmZhIn+kRry1grikLGoiUM4hNvYuYu81buyWo6Kg
	s0i916sMsouxih/0NJOiAnBK1gxkvBHY285rm9UokDiHH2tZkK8Q3fVDtTRreOvqJFm8xx6mwM+Mf
	TjFjjYADArdrgxF64lZ7bMqlMPiVyt3BEpLDihX/5ufIUVTKrrm4dEkfI7SuGqYgVLAmNSLb2WGAl
	dyHf3lUf+6Hs0WKXlg8NuvMVfve5BkWSj169kNUst9V7D5QuzpHAw9PWuvn0VG6qjLIWQoKZIJK1p
	g9gCuUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBx-0000000FuaA-3VXG;
	Wed, 14 May 2025 17:46:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEnn-0000000Fief-0l4k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:17:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E9E449C80;
	Wed, 14 May 2025 16:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47427C4CEE9;
	Wed, 14 May 2025 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747239470;
	bh=aqUoPtC1xc3xR9sEMf8NIVU+ZgOW5Hbhj8zK97ZrDzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sq4ITlmOF1IOOxPyyWtXgca8yT3bBrZZi9gdMX9Iw1DuwVQpBYo2iMF7Pd/nNTy19
	 O5oaVqijiH5kpwJ4nr+7Expd5Ml5SpoHwLgB2roMn3biWp7W3eKzAnsFoqOAa9Lxlp
	 7iCG6eF0QAlIUsKzRMaRdbRpuwYX83RM+Uab9BnrzYwI7OIdSfiaPJcFfPxyEyjXEt
	 moMkoBsVBIQVi/yoT7OxCnfzJGNVCCNGdlgWmc6LipOX3ipqO1E6uU4pRCrXSC3UOf
	 CciIWgbZfkLHWWgs/iQSNNIigyJS+0r1PEGHniOKezvaxbBLLHiyWc9ekZRgnV4ME/
	 mMAMfmRzfseNA==
Date: Wed, 14 May 2025 11:17:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 04/11] dt-bindings: firmware: Document Tegra264 BPMP
Message-ID: <174723946819.2530421.5585015626188126772.robh@kernel.org>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506133118.1011777-5-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_091751_235999_780D9FCC 
X-CRM114-Status: GOOD (  10.67  )
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


On Tue, 06 May 2025 15:31:11 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> While the BPMP found on Tegra264 is similar to the versions found on
> previous chips and should be backwards-compatible, some changes could
> eventually be needed. Anticipate such changes and introduce a chip-
> specific compatible string.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


