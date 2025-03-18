Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6D9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pD7RUUHJI003EUwPN3gVqGhc0IamRvgxA9BcNnZKI3M=; b=bvcGWOWLFh8mN38LsskLLYy33B
	0/m868blNSAs9m0d635SxDXHznTuCTAwQDxFG50j0KbrtwcvO0vOmJUbiJjxmxZmzMM9tKDCZuD0t
	TUkduM5zB3KV56VEDQpnD+XfHusp0X2M7WKM9Jbl+BBi2tQBv1zOXhEU1LVEX34GO6f/LWHexNTAX
	S2t6W3t96WRszRtkB3lxSDKnw3Zj0YQ9IzoEdXnNW3nSdnGLZlxgMwkIsuTzUZp3wZd8W6t9mkrEu
	NgfsBTHk0CEutOKer7f6Pxoj8desIPvPFqvp9R2VT5gC4Ku92+xkxJqK5XKMbDf4HrR6vg0i7cE+i
	nhHUdgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuayQ-00000006iJs-3HoQ;
	Tue, 18 Mar 2025 17:43:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuavZ-00000006hvV-07J3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81EA15C5872;
	Tue, 18 Mar 2025 17:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC27C4CEDD;
	Tue, 18 Mar 2025 17:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742319632;
	bh=cUYQCkESwWasI7h0pS1MGj7Wb8ODx2zDhK2nrfIcw9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXh9oDS4ma/dF9t+gI30B7iGD1BB8HaFWilQ2nNDj+NT41/5m1G4lzjmyGzTdfse+
	 tlYjXkSA00ucDQHWwvzE9fosNBNqmrQvV1weeWrhzKI5/JsGoHBYO91E9uOJvO7I+d
	 OSLFAk1wxCpa2p/DI4nUn+8+EkUcMOn6WnyUOZ7172BfF3a7W83p4WnqR8oEokGUxc
	 QyFCj0GJSpC2bbTR0qIrjKIvkY0yHQy1FAJ73tn7XtSGrwZBBNzYtegyPq2P6xbb7G
	 p3il3c6vMxxlFlfxGai4s/qRj8x3hPkmqYUXd02V2ndEaCV/iBai69h7Jz9CMAInPJ
	 FgYBWY3fFzWYw==
Date: Tue, 18 Mar 2025 12:40:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, coresight@lists.linaro.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@linux.dev>, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 03/10] dt-bindings: arm:
 arm,coresight-static-replicator: add optional clocks
Message-ID: <174231962960.3279035.17499878913808619235.robh@kernel.org>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-3-bcedd1406790@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-fix-nexus-4-v2-3-bcedd1406790@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_104033_109217_58DFE26D 
X-CRM114-Status: GOOD (  10.69  )
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


On Tue, 18 Mar 2025 15:21:56 +0200, Dmitry Baryshkov wrote:
> As most other CoreSight devices the replicator can use either of the
> optional clocks. Document those optional clocks in the schema.
> Additionally document the one-off case of Zynq-7000 platforms which uses
> apb_pclk and two additional debug clocks.
> 
> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


