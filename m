Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B886D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5qJU/TE5Skzx3xGRDMH5cN7/oDy/Qd4D0VyQxYTUaM=; b=MWhscLbbdw5AOHkU+BV9ntiam3
	j1eGWRNEkntf4s4//5eSd78823uA0pO2pgJjlaswgD46DUGE7/vZ1ji3fuAEljV9PPc5EyelqBe+r
	CL2J4E0d5vbgg5lnIlyxzsVIEjT2t/sVPEtyP4lpgi63kX2S3HVokHnAnIiP0ZfYkU0bix2zF+gLA
	4Hfppf92Gqsx487FLHb3dx4GLdgNvULaFbKXDqIX2ktdiL0S21V1ncwVbMtGaPSF98p/Y52m+KR3L
	QPF44Quofb+CvcuKUTER0/ZXvrk6yjE77O1TE73J/sMfNjbr2Nwrb2yFWCRX8UfqGxVWzOGdegnjW
	2HHdozXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NzF-0000000AUwl-2WUi;
	Fri, 08 Nov 2024 12:21:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NLM-0000000ANHF-3y8p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 734D6A41FDE;
	Fri,  8 Nov 2024 11:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5222BC4CECD;
	Fri,  8 Nov 2024 11:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731065999;
	bh=530C77pHMSYwx7wryvABLre4iXGbGSVU8Iaii1O2Cy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRHy3NH7ogg5lgWteZRyQaQOGeuc4yz8zUMIxhr6LmrH17cIZnmIfkzHrKvyBeA5z
	 nIhDySh7yt+7v5B3jo7ISrCc39mTpGjqh0YIN1F1qK9zCM8VrGmcmj88JP5veHx135
	 gcGw31avgtXGmfagXTt1xQeUysCSBWaCZ8jm9Une0WKmFC457qPhukugy16fSgcbnk
	 Lbn/ZbFPZXzkPUpPX+w0fq8VXJLA7zkZNwvGKNQhZregl7xOKjydvZ4jk4dC57fZ+B
	 RUdrnDa41Sp9Kx67esLqFfV4oceLM6fvP0wR7V5qC/bhs4p8RgCc1TGem9u/o66b73
	 8dfUM2slJVcAw==
Date: Fri, 8 Nov 2024 12:39:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Ajit Pandey <quic_ajipan@quicinc.com>
Subject: Re: [PATCH v3 05/11] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Message-ID: <s5rie2osuh2ngkwd2jinly7ulogqqeqois724h3e54a7rqrn2w@wn3yypxi7wca>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com>
 <173104478441.565041.9851772057058427001.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173104478441.565041.9851772057058427001.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_034001_134433_62650A22 
X-CRM114-Status: GOOD (  15.46  )
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

On Thu, Nov 07, 2024 at 11:46:26PM -0600, Rob Herring (Arm) wrote:
> 
> On Fri, 08 Nov 2024 09:39:22 +0530, Taniya Das wrote:
> > Add DT bindings for the Display clock on QCS615 platforms. Add the
> > relevant DT include definitions as well.
> > 
> > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > ---
> >  .../bindings/clock/qcom,qcs615-dispcc.yaml         | 73 ++++++++++++++++++++++
> >  include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 +++++++++++++++
> >  2 files changed, 125 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
>    19 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.

I see this patchset being sent again without changes and receiving same
errors again, so maybe you expect different results, like some review? I
don't know, but just in case that's the case please carefully read
message you got.

If lack of review is expected, then of course no problem here.

Best regards,
Krzysztof


