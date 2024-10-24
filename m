Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A442CCE8E91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMJ+6uQYbJOpAGakrCR8nunSPz7QrQJmxVPNxLflxqM=; b=3R+EKaS3aVsflh7ZEqyIkxFdZ7
	a2b9JPUAh98fa/zXKj3rGNU2Nt2KXpewAmW+AIfZEvUiguS5UEppCves79Q3F3igtmurja5lQcQlg
	WFWzACVP28aDqoRQ7Dk+tJ1euezHMy0brO+1+wmMQexi7AFEYYUAp2WQfN1L0jiqvSQ6Kh+kYIFXw
	hizeVVF3yODkXp+LrGqBJLzjmotPw042Ak7U1LnmzqShkBz54Rp0vWBW3uMt24795z/opXr/DIzra
	kM6YS14XUxJG97GMhQHSmSi4dVi2oMZB2FYP009QHLf0U84/jiEcAjykA/Ac2aB2VnCw4of1LJXhN
	UgpyfDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40VL-000000013ZG-15iR;
	Thu, 24 Oct 2024 16:16:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zRP-00000000rek-0dxl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:08:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21679A455C0;
	Thu, 24 Oct 2024 15:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42EDC4CEE5;
	Thu, 24 Oct 2024 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782478;
	bh=G/5iQPqYa/lDZoknc7Hbx360J3DWwXAFD/scyK1iRjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2dc+NEY8TbmlJwRn3drLG99OfJ33RUQh3pzdyCQVzheHiEaetaZCbfd+x+9ELG+Y
	 5IhCl2SoGDNzYEP5epNZzUPSb5R+p7e7SXL5TfXdU3NIBiwj+tXZ6ndalSg+LIAk5s
	 Byh1w86QBM03wNm8nfrV/bHQ/3ZGzSihsviTGHHcG/lewo5oY2wyoo/NonqHISWF2e
	 vaM9pSaYN3v3nP+vOEvMVelqev+smXf1NgSjvu1/50BOt26R1NI7/RC7/bFwJSjhqO
	 umvSpcyy1y7Juwjce96U6JKuJcxCHXhXoZcipEfroz5r28ILSJ/UuVX+LUcAuZFy+P
	 xnsLsdTZt46cw==
Date: Thu, 24 Oct 2024 10:07:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: quic_sibis@quicinc.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	peng.fan@oss.nxp.com, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	vincent.guittot@linaro.org, arm-scmi@vger.kernel.org,
	etienne.carriere@st.com, dan.carpenter@linaro.org,
	michal.simek@amd.com, sudeep.holla@arm.com, f.fainelli@gmail.com,
	james.quinlan@broadcom.com, quic_nkela@quicinc.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] dt-bindings: firmware: arm,scmi: Introduce more
 transport properties
Message-ID: <172978247557.479027.5212897770192282629.robh@kernel.org>
References: <20241021170726.2564329-1-cristian.marussi@arm.com>
 <20241021170726.2564329-4-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021170726.2564329-4-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_080759_278850_8BAED801 
X-CRM114-Status: GOOD (  11.51  )
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


On Mon, 21 Oct 2024 18:07:24 +0100, Cristian Marussi wrote:
> Depending on specific hardware and firmware design choices, it may be
> possible for different platforms to end up having different requirements
> regarding the same transport characteristics.
> 
> Introduce max-msg-size and max-msg properties to describe such platform
> specific transport constraints, since they cannot be discovered otherwise.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> v1 --> v2
> - added vendor prefix
> - dropped warnings about resonable minimum max-msg-size
> - clarified the intended usage of max-msg
> - fixed Cc to include all maintainers and using correct e-mails
> ---
>  .../devicetree/bindings/firmware/arm,scmi.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


