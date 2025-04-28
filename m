Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA81C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nz7ID0KToPMLRXoXRYtKNRVZC8wb0mcN+wMWOp3WijU=; b=0OqEGwdq9mzbdbFivefh/KbCVX
	2f7UVA0b+jUNwRJ+a7A86zMuQS/FJPpBHrH+qI6MNv8/kKZGql/GzIJJvooOgQc4sNG9O9rTfRhVL
	BhjCIV4DOVewPM4bKfk9aNQWpi26QH2fx0FBpRhEfoh5GEpV9nLaSCgm6u0sHK1nit1rKNhUOFuBi
	2beR39WT00LFcCXN7hx6MFGkg9/3pnc1VCHFcmFkEOPJy6DNNTom3iDRf28+KxUe7DpxPVmCoTHPr
	P8C9vlULi21TyuDKw6nZ72Jy+ULTiO5fP9vLx7pV++w3n0ZZ/5fgeas4IhK/lVUPnMXrB5Zn1MM+Y
	7Rw8Eg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IeW-00000005Cmj-0yJD;
	Mon, 28 Apr 2025 07:11:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IaN-00000005Bzb-09Fy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:07:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 816AD4A545;
	Mon, 28 Apr 2025 07:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0891C4CEE4;
	Mon, 28 Apr 2025 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745824046;
	bh=Nz7ID0KToPMLRXoXRYtKNRVZC8wb0mcN+wMWOp3WijU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2IPHs8WXiEp2VvZ7TMUE9w3k/oj3rFB5rX5Fgr30gzWv9yabSWM2Ux52QzK/wKS0
	 9OAGc3WOjJtvf+fcR66C9RMywHJNOlOjOim10D47qbgpd7Btzd2VYV1wWSfbcZ3lnX
	 OVoiBBSevbdqWtYKmFXCupz4qBHpQcK2wHwb5/2WPV74xZZU/bSx//8INuynhrHMjg
	 L4B2ahTodIs9UrUqXuzftgsLm8PnLOshl/efG810xdbglMMJFgjk6xcNzlWlMQWoWv
	 UGf7ABlSwaMDug2sG/it5/hPj4ynwtDO+J3xzfhARBnm6mfSQH3HJLzU1R8WlI48Md
	 kJopY1aYx+OwQ==
Date: Mon, 28 Apr 2025 09:07:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Lee Jones <lee@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
Message-ID: <20250428-prudent-hasty-pheasant-aecec4@kuoka>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_000727_093758_E6DCBF4B 
X-CRM114-Status: GOOD (  10.47  )
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

On Fri, Apr 25, 2025 at 08:47:01PM GMT, Dmitry Baryshkov wrote:
> For some reason Lee has mis-squashed two commits, picking up one chunk
> from the first patch and one chunk from the second one. Rather than
> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
> Add qcom,apq8064-mmss-sfpb").

I don't understand: that commit looks like direct, proper result for
https://lore.kernel.org/all/20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com/
so where is squashing two commits? The diff markers have offset by few
lines, but it's still just few lines and they do not matter - there is
no diff/patch mismatch from that point of view.

Best regards,
Krzysztof


