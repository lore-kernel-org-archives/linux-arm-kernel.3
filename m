Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9473DFCD0CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3/KfOn3fCijGvUHF45NTjp3D+EfS8Qud962UWw4zAI=; b=t7WVEW2OI/0nlvtE9TMIBRb/Zl
	Qz3ep2v5vKz5R/kp4+sGPTgguF4Ew+SxpTmDi3Et4DrDjUVMB92PfolUhc9Kr3AxIj55NpDR4rSxZ
	/Xkwpg/yYmqTfVd/bt2xNzhp8q2jJ7WO3W7ZwY27w7NcsWPt2FFGRcBEMhu1FiUz8Fzb3Nw99EtUL
	uHnKcmOE3tH2A2rsvwi4F46sRzqyCOkZK+kHzk0bzLhmu3AHBIFlxQbKE7ShY59kI69REMASUF2Gt
	zC2LtyUVbxkFCD7/88ncYaZaEG7STjgeCERqnKHzubL5xKQ8yqitTiAiOPezfWIRqWA4eiaNFIw9I
	IxHlesqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2m2k-000000081KT-1g2D;
	Wed, 18 Mar 2026 08:14:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2m2j-000000081KL-1L2v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:14:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAAD5600AE;
	Wed, 18 Mar 2026 08:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DBFC19421;
	Wed, 18 Mar 2026 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773821656;
	bh=TJmXFfIJfaa6VOTzzmQKFARsgVBOZMjy1CMPytzgCEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SpHpJhBWEv4EzWWo6op6XaS8chwtMxLg6jYhPsoBD3kRWXx/RnTLHv+HXQte9Zc1r
	 XFvmderltrtB9O9PDsqNqMUke2qlGrIDk6noceCtU65p4gvQikiGern2bIsT8El5zw
	 6z/vcPv5p8X8hErUTsOqmgTFFes4v5vlzevULDI6D8gW/smSQ62bs8DSrc3AoASP+u
	 SR42rlx2lAbL+xbNmuHbbBnJN+G8dwU79Z7r02XhVZQy+USDKkHPmWSjJSMG/CVlqw
	 rbTHIBBrfk6vOLojG6iP4PLTzXMLI0e7a3C9yvF2e5ZeIIoDwhqWMhPagT+7j96k21
	 /XhPyxsrJ8kBQ==
Date: Wed, 18 Mar 2026 09:14:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
Message-ID: <20260318-mighty-handsome-spider-814ff4@quoll>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
 <20260317103336.1273582-8-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317103336.1273582-8-andre.przywara@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 17, 2026 at 11:33:33AM +0100, Andre Przywara wrote:
> +	return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
> +					 lfa_irq_handler_thread,
> +					 IRQF_COND_ONESHOT, NULL, NULL);
> +}
> +
>  static int lfa_faux_probe(struct faux_device *fdev)
>  {
>  	int ret;
> @@ -854,6 +893,12 @@ static int lfa_faux_probe(struct faux_device *fdev)
>  		}
>  	}
>  
> +	ret = lfa_register_dt(&fdev->dev);
> +	if (!ret)
> +		pr_info("registered LFA DT notification interrupt\n");

Drop. Drivers must be silent on success (mentioned more than once in
coding docs).
Starting FW update would deserve a comment, but probing a device or its
resource is completely irrelevant for the user.

> +	if (ret != -ENODEV)
> +		return ret;
> +
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 

