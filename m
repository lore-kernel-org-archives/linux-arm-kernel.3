Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04095C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYWHO/BYqDIdn8dYvGxMzWWVhK7Sib/Rj+KSMAXGayE=; b=R5ys0aigxknHGvQC6IKIhn6r1f
	Z/qiW52fbVbybhDHtXbSXl51CkZqebcgfH7GC8RlpzwN973u3LxwG29ZPP3i4wJM5Dn12N3YJ4neC
	3Jhztg5dAgzO5Rgj+nwlto3XxuaPp4HNIxzMoGBL13mOcyNp+2CFWDhKMJiUU4Ith1+riiANTiOMt
	6CtaqnadZrp04IptNpT0h1LBE8EteY4A7ROUT5s8U9MVcYQyp7L5Ta9URZH6zCxPBw8j9pDx/ACz3
	gsBzJzxFn0Juxdb9nZtl2JIgANXYpmJndn0ZtrYFNMC7irQThnakJaFC4jwu4eNcXOonH784upRCJ
	XM1b6s/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JJO-0000000BBNY-1xQ3;
	Tue, 01 Sep 2026 07:53:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JJM-0000000BBNG-36U1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:53:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DAD49407AF;
	Tue,  1 Sep 2026 07:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065CC1F000E9;
	Tue,  1 Sep 2026 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788249219;
	bh=nYWHO/BYqDIdn8dYvGxMzWWVhK7Sib/Rj+KSMAXGayE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BvCQ+XbC0PM01UKGWp94G/nCvIBwI8I0D3vl5AA7LjToukoDS+uUK7MO1pIVVl/aj
	 I6t/QlHPrecba7qBDUAccRf6gI1ZBQxnlTqwGytgRtDi5zpjC6kbv32j+PaIXlOXFH
	 9AXIAO0IRvO5rzlJrIHKhnMzrR5zxIyXRYX97+rMnZ7qAZe8mklMAoaxlp9453rE8G
	 ZkzxFTPokaj1OxzVGAHUAsjzQ/nLqVW9oo2YeH9ncqdqd+km3mo+YgoppSjz1zNx2r
	 LPR3z/AlTE7HCCxppW52NU78gn29xeWLHpkqkucsgtYIK7sMpxnMfOy+aEAuHbQgFS
	 8Eazk6ZL0ezRQ==
Date: Tue, 1 Sep 2026 09:53:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Georgi Djakov <djakov@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
Message-ID: <20260901-orthodox-hyena-of-abracadabra-fa2b31@quoll>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-6-6d47636a8f09@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827-kuno-soc-support-v5-6-6d47636a8f09@oss.qualcomm.com>
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

On Thu, Aug 27, 2026 at 11:21:09PM +0530, Hardeep Sharma wrote:
> Document the RPMh-based Network-on-Chip interconnect providers and
> associated node-ID definitions for the Qualcomm Kuno SoC.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 118 +++++++++++++++++++++
>  include/dt-bindings/interconnect/qcom,kuno.h       |  89 ++++++++++++++++
>  2 files changed, 207 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


