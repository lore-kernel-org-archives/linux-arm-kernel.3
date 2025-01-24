Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E104EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMmBu8OT3itaE3ZwYEY4iEwYONa4CXAPDWZGTbp5It8=; b=YhRPxBlOdtXa66oBZFjv0c6Rvp
	1p5SylSe6TJrMgtN7hNxtGKeD2ZKblj3v9N4DhLAA7k1zasb/iEjOrVo8X1Z3L7zcSr3PNnHHeMkX
	fCfoW1ZW07aAUB/7bkX+HI2xUfLXD3jG9r72uALTDeYpM3dk1RxzoYX8L/Ie+raAhrugR7AAB/GMW
	dE/Jxk2+qzsTRzVzBOdHQktYj4S3cnK3+CNFTOBjRtIb2a+mpTx9cCCT/1qfUQPQHoTVtUMBISQjK
	2uJ60woN4jwrlyMNWsRbZC6lQ++hTkRzYYL1Ga6JoHGUtKsvweQBg3TBW3z03YTibzyzg7HD8PnaX
	Bk9wSw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEnP-0000000ECaL-1zi1;
	Fri, 24 Jan 2025 08:12:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbElx-0000000ECNA-40Ej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:10:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7965A40EE1;
	Fri, 24 Jan 2025 08:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFC6C4CEE2;
	Fri, 24 Jan 2025 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737706236;
	bh=5/s9gWaTZKbMFZoIoQ7KLfhqbFshe8YqcBEHwCpr/IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBEEXYtF92FvxyOXkggIvGkGgY3f0YCptxfceXN84Me+B44IV8zoqvVdCA7Gbg8NJ
	 X29+mK5FhpgkOqvVuUmP4yaH94gKUtjLJrCMgTcyYEMAq0yUEuaALx79OXfv6CMZ6Y
	 9stp7McnMrRxq/GMPnigRgXXKs7zizbhRapvQEL+2fnemWqYeT4H/DCrKKb5kKWaS1
	 VVGg2lezuhJfeZcytuxo31ph9OUJWdnlCQ+e6AD4BnVE76gJ0gpugSh9a5sZg1yKD7
	 oEsvQO12hkMel8LfZO3zNcKhDntRktIrPdvgquLNhZXoCSC7LVwGIhOTTA1coXR5FE
	 gbhJ4qFSq25jg==
Date: Fri, 24 Jan 2025 09:10:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v2 1/2] media: dt-bindings: update clocks for sc7280-camss
Message-ID: <20250124-raspberry-aardwark-of-downpour-fc12cc@krzk-bin>
References: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
 <20250121180746.1989996-2-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121180746.1989996-2-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_001038_061389_FF1DBB6E 
X-CRM114-Status: GOOD (  14.88  )
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

On Tue, Jan 21, 2025 at 11:37:45PM +0530, Vikram Sharma wrote:
> Update clock names to make them consistent with existing platform i.e
> qcom,sc8280xp-camss.yaml. Rename gcc_cam_hf_axi to gcc_axi_hf and add
> gcc_axi_sf.
> 
> gcc_camera_ahb is always on and we don't need to enable it explicitly.
> gcc_axi_sf is added to avoid unexpected hardware behaviour.
> 
> This change will not break ABI because the ABI hasn't been cemented yet as
> the dtsi changes are not merged yet and there are no users for this driver
> as of now.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../devicetree/bindings/media/qcom,sc7280-camss.yaml   | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


