Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6847C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pObYw8Cc/kWw5BQOms1Mhwed/Td2tHDM4/gVcUyLUBs=; b=oAMTIf98AxCOJ5SW1Vb8zPsBy+
	k4RIQftopdsL49X7TNa6qNcKASsfncD4TQOdj2TUPIY1Js2x0Ektn5MCIQeCMBpEqELkHQuaPxtDS
	PIFeH2p3r3FD70wXhpvV+hPYnaf+nU4vlj+rV1UEqyMqemRRUFzf/5G97jXrIe32TVP8VJ9P6Pht/
	HVXmiH7Q6zCbZ2ExeflmXAYKeFcPcgZBuzlXpad3n0Aqr+LNntOLqWox/f5xILq4NsegTcR7AF5zE
	cgKPKgKaNFqqcZvDeQpnyv1+TXsJ5IX92pAQBJNyb1yTGIHXnHxjkBO9bNisLuB7hHjvm41X9nDah
	zZhHqHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tub06-00000006iYw-1xRJ;
	Tue, 18 Mar 2025 17:45:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuax4-00000006i5H-0quR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C68B55C3DE2;
	Tue, 18 Mar 2025 17:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5F9C4CEDD;
	Tue, 18 Mar 2025 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742319725;
	bh=+NevMaFlqFLQOGC7iiOMu0IHSa/S4jYieR4USGKS8Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rpt/VNw+DNDutc3BYIvzMBJ/RGRoLoE6yshO5swsZVCxR34rM2IQQVccps39AeZ6s
	 Rk/anR8cX4IhO6VjH93Uz+COn5cH7NcmQUfWI+fpNi1KYictnLfA74RUcrqdwVmiMw
	 o4GpRsnCNd5cg9+3d+9pXYvs1BukYPmBnL8643ta5ChaZfadqUBkwawgFomAjTEmMk
	 TLtVH22pWLrle0lgFdedc5vtJ+ounqCkJaGqR2ZNAxMMWEdyM1cucHUEYOq+zsIOsw
	 oW91W92E8OGVxEYC1mEHnV9AK7tldQuM2JBb5MciMq2pJWUIgL7dKCqgJ1NXbWi1db
	 y3GPyx1k76IKw==
Date: Tue, 18 Mar 2025 12:42:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	David Heidelberg <david@ixit.cz>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] dt-bindings: mfd: syscon: add
 qcom,apq8064-sps-sic
Message-ID: <174231972363.3281332.10722530407269396405.robh@kernel.org>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-4-bcedd1406790@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-fix-nexus-4-v2-4-bcedd1406790@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_104206_283201_8DF92EC0 
X-CRM114-Status: UNSURE (   9.25  )
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


On Tue, 18 Mar 2025 15:21:57 +0200, Dmitry Baryshkov wrote:
> Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
> present on Qualcomm APQ8064 SoC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


