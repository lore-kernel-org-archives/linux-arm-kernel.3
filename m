Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBFFCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaplFYDVy88dHfc+/9i0wzyvMhjETYR9TAcjH+qVJMQ=; b=C91V1MVx2hNAtrBGU7bi7vsrLs
	CJw7Ij+zMQFd2Ub5HtK3GyXPevkML/4LccPccFveaA4+wN8k11YHaVqPe6Lv2Ndc3CiK0C63Citda
	MxuzOk2oWMK0Vv1Up2EjNbmfaWYolGRAJhoqGas9VWY5UGfbpcfsJCVj1rTDD6v+oX3MpEcNWfxNP
	w/jfrQNmUVtGk8EteB/IylnqFHax9bZAvGNWXYJ1pZGIlsJXb0IhK18S37a9FYQB8tpjAJ8qneysx
	SmMyyzA3haw0GBviWqH/r0Y3XvFojwCWEINF1sf/+14PHg5piHXOtdMr3iY4vxDeSN/o+c0C94T/O
	JnIgdTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhhA-00000003MG3-25Mm;
	Thu, 11 Sep 2025 13:50:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhh3-00000003M7W-3edr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D628940430;
	Thu, 11 Sep 2025 13:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8595FC4CEF0;
	Thu, 11 Sep 2025 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757598632;
	bh=m4shjtrhQt8FRRF1lcL5ELoPHuhcDARb6PwIqI52w5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJeADdTlgrbUqetu5+RC4UEqVNw6aKMUcMP5Ta1p+BjUTCN2/yIzLk9p/ROs/PJuN
	 LRNx4jeh+LJMhXfYPmNdRNsnjTkXpnoy5+OAE7qy1RleZ2KJUu8s0+EU0B2RpEbKXu
	 pnY9+zi3smt6nBFb6XEpCr4j+cig6Z6Q/m43Sv/w=
Date: Thu, 11 Sep 2025 09:50:31 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_svankada@quicinc.com, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Subject: Re: [PATCH v3.1] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
Message-ID: <20250911-crystal-dexterous-ostrich-fcdf3c@lemur>
References: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <20250910104915.1444669-1-quic_vikramsa@quicinc.com>
 <5a087d08-273e-4740-b47d-fc25be952ebd@kernel.org>
 <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_065033_930152_5C8BDC88 
X-CRM114-Status: GOOD (  13.02  )
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

On Wed, Sep 10, 2025 at 02:25:30PM +0200, Konrad Dybcio wrote:
> > Please version your patches correctly, e.g. use b4 or git format-patch
> > -vX, and add changelog in cover letter or under '---' of individual
> > patches describing changes from previous version.
> > 
> > What is v3.1? How to compare it? Try yourself:
> 
> This is a weird invention that some media maintainers seem to promote..

Please tell them to stop. Patch revisions are not supposed to follow any kind
of semver. It's a new version of a patch and it should always be a simple full
integer increment.

> As a b4 user, I would also like it to stop, as doing anything other than
> v(integer) will open the door for unlimited craziness

To my knowledge, no tooling will do the right thing with that -- b4,
patchwork, patchew, etc. It's needlessly complicating things.

-K

