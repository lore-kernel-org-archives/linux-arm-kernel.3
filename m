Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB88C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOUr/w9tvJSUwNM116wHZFICZXpfuC+AC4VggkWarkw=; b=XN4ByIv9CrHZzsLlg8mCTAGDol
	apg14V0042keksz1RRV5WDDIZCgny2QMEUBKr1iEMLfWD+k4bAvmv2NDv/eLKlj0Lr8l71SOwrtko
	6WQu+YCYQHFTuZxSeh9Jpq7/vJiWAsLeqNMFIAW38GowAHPg/rzD5npnef6yEjUNsTCPkFPRhWuhy
	WsG2W3h8gMs89rpgcXJjcx2UBXl8M0Q2by3g4PMZWmShk5224Q7DOfIHVaUBJRN6hY2lPauYVOOV5
	alXLvzUkQ921ZkTmSdqcK44U7w9qMAOjG/qWV7dozStCkjWznZ53//OU+P/ScgH51xlDwt8rIneDH
	n/LTO3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAPw-0000000B0gQ-374y;
	Sun, 23 Feb 2025 11:45:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAGF-0000000AzWd-2W03
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 11:35:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0104E5C65F5;
	Sun, 23 Feb 2025 11:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F312FC4CEDD;
	Sun, 23 Feb 2025 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740310502;
	bh=SIoCw3QNopW0wdw1Ltz/BztUJr/y8LR6kPoAGjKQVYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmmNrSrasm5Sm4kd5CJknE2jyM6izFDAYUFNk2+a52T4XF+nqNiif1VRMnQtJ/EwT
	 mYDP2fYxFGbS0PnBubBzits/RcKgJB4es/LcnyhAiQYTfBhXV0QE7Ze3+3MKql+QXD
	 3GcvqtenvlYCz04kwKd8ToNijOgTxOlOFBAzvIh7zlKiqHKdVcLn6KUZPlmZSpdtSu
	 9QwAjQhPoN5U5XPqws1FL4kUc54tAS1pfIPihsEprYiRlT7mr9hV1NCi/mLhxxPgL3
	 hfUQQdc2a56irEnsXfZwF0PP+8/cgIL84le9SlDETFz2+ExQyvnWtk1X2srUv7UQ9h
	 q51QuR9avbwAA==
Date: Sun, 23 Feb 2025 12:34:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Suresh Vankadara <quic_svankada@quicinc.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs8300: Add support for camss
Message-ID: <20250223-holistic-booby-of-persistence-e51b76@krzk-bin>
References: <20250214094747.2483058-1-quic_vikramsa@quicinc.com>
 <20250214094747.2483058-3-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214094747.2483058-3-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_033503_690772_C921961A 
X-CRM114-Status: UNSURE (   8.87  )
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

On Fri, Feb 14, 2025 at 03:17:47PM +0530, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the QCS8300.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++


I don't understand why DTS is combined here with media binding. There is
no driver, so this canno work.

The binding is no for arm-soc, but for media and it always goes with the
driver.

Best regards,
Krzysztof


