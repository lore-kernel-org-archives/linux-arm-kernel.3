Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AA4C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TzwjCeVrV/dKWsvdns/w3UOhTzy4Z48/ecJnntn9as=; b=fMWOVtTk1EWsljvkVSteUnR+lh
	IlGlQ8X4MrCjy/fMLWZx0hVdu9UmhjGWMsMFNxbBphHcUhs/9cdnN51VlbAJ8CO6XJs71K71JQ78s
	KyLd7Bn8fia2me/YukHO/m2ShU9R+YEgcmQJ1pCV2AllKUAjt5Fza1mIOkificg2YY1MxYoWlZxX2
	tV6Bgp4ei9f++hZI83+daNWsw4/dOYP8NphvFv01c1KzsdpwmRpsi2QUnhtPsmtH5Rg0z/U5RfE6L
	U2oOj8DvQ4PvyBI0pOEXBEwfqIc/Oar7bXNi2Up4SxxsaBlDAvgLkWap+8ZHal9D7tUMuUK2+BW/6
	LU80mQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tub1l-00000006iq0-10bW;
	Tue, 18 Mar 2025 17:46:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaxG-00000006i7l-28NE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A104A48C55;
	Tue, 18 Mar 2025 17:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256A3C4CEDD;
	Tue, 18 Mar 2025 17:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742319737;
	bh=nDTSQtsXdcFV3wn+/fgzKF8to8BLpGLSyAQrro91I+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYEw0NL4o1bJLrWVXJ1Lu4adR2NQNviKVPCVOqWfDPrxdMD7fcslpbkoWhpqaz9Ef
	 qbbIR0BE3XzE9wKukl1+FQFydksuoISNW+iW71CSAWxe+WFJwioFz6XcoKCxplLERs
	 hwRa3tN2glcCuTcJ0MZpTxXRrBgjN09Mrgb+lrgMYIG0tP4J9r1Gz1D2wro15a1pRm
	 L/WQ3/ecbCM/RWapd8MyCIvlMlmMqdSYIueTCKTMgbIcMyFbAQhhY9uaQaAlmTvRZi
	 0x+/hosRV8P1aRbXKxAKSbjfRVXv2Sum6iZizbeWWhRgVHUhXmWzHXTm9QEyM63xG7
	 q6+r/RjMq9kbQ==
Date: Tue, 18 Mar 2025 12:42:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	linux-arm-msm@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
	David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 05/10] dt-bindings: mfd: syscon: add
 qcom,apq8064-mmss-sfpb
Message-ID: <174231973562.3281729.13844213824981860585.robh@kernel.org>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
 <20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_104218_615167_CA547924 
X-CRM114-Status: UNSURE (   8.64  )
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


On Tue, 18 Mar 2025 15:21:58 +0200, Dmitry Baryshkov wrote:
> Add compat string for Qualcomm MultiMedia SubSystem System FPB.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


