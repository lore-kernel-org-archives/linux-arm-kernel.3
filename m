Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3292CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjrTjLexc7KcMFp2dp1pW9UVEwPBABxXltjhJAJxjvA=; b=Ma/oGRWHtGVwjPWEdLi2oC0ESm
	NhPz3jlv9oYT2BIWdKhZlGJOyYubt49AvHWB021UPsGqfCKBPSB3dt9b3L9CKbwmPPpdj2nJd42TV
	X+sAvOts2iq8xHQdrINuuMdBG8dhC9qo/STgkHrqumHexdHjs89DzfwfRgi447RJk1WTVuWDsmGXZ
	sdZ1BdjVWQBD3aVcwb9VbdZsL50RUyWmga7srdwY90hGTz4F7j5gpHxHqrVfDF8yenw7eeIoKYAYm
	VAl7Lw2auMElydpIrRIgQu1dzoW9w5oPVO2/r7sgZ/EW5eqWhlH1TO7aBhHmoUpVuetsg97YGam4E
	hSD0enRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0joR-0000000B2MX-2FRK;
	Mon, 22 Sep 2025 16:54:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0joQ-0000000B2MJ-1W9Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 16:54:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6E8C601AA;
	Mon, 22 Sep 2025 16:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F61C4CEF0;
	Mon, 22 Sep 2025 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758560089;
	bh=ymMmzTp4EnxrYkm69r1TPDGsncG3tXK6gHua10vVyNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZumRcMh8jm0KqGBSZyCF42mMASpEBcfAlsxnbT1a5Cw5HjxL29txLT6wRycCpy58/
	 xCfoNVjWsQFAjYPXIQ/ZKudI3gEYpRPNGqql1MP4dJ6bWxv2B2nyMrPLcO8VZqsQpx
	 Nr+GPl6F2D1FXZ7p8fI9V6EmIXws+SJm7U5npCZKflv7cQcodcw6Hs5Mf5sVA786f7
	 eVo0OlN3PEPh+4/dCBS5Z6+ZYaHpossPyHAm+QPB+pt7VrRUtE0jzxkb4SjfVpplVm
	 5qX81wdLsEPALK1Kxip+zVgsC1KdVfeYX2sWh615p8TRTSyZWeWCUZfERYi8ysLYmN
	 68IZ8ShEarFXg==
Date: Mon, 22 Sep 2025 11:54:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, krzk+dt@kernel.org,
	andersson@kernel.org, vladimir.zapolskiy@linaro.org,
	cros-qcom-dts-watchers@chromium.org, quic_nihalkum@quicinc.com,
	will@kernel.org, linux-kernel@vger.kernel.org,
	hverkuil-cisco@xs4all.nl, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, konradybcio@kernel.org,
	bryan.odonoghue@linaro.org, catalin.marinas@arm.com,
	quic_svankada@quicinc.com, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
Message-ID: <175856008717.464887.16008377245653350497.robh@kernel.org>
References: <20250917130647.1701883-1-quic_vikramsa@quicinc.com>
 <20250917130647.1701883-2-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917130647.1701883-2-quic_vikramsa@quicinc.com>
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


On Wed, 17 Sep 2025 18:36:45 +0530, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> The three instances of CCI found on the QCS8300 are functionally the same
> as on a number of existing Qualcomm SoCs.
> 
> Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
> common fallback.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


