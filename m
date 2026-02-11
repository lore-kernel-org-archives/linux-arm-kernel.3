Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0A6ECD6EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns5b3QgVBX/nuFL0jbZdeKBQOvAGTyGkz2HKN8fiAo0=; b=z2KsEjgZvsMf1+qQ3ucpwAabL8
	tLqu/chZVH1OY9eXKb15BfEDuyuWFg23N/Yy1htYoJrFWZPNI8XtWDhOcnlG6s2BX+aEhUWA50LqH
	m0xZ6hgKwP/CvldNztvaPFUm9HGi4e/wBC68UgTLrNvrvZ+WFHZ06afXx5R6HE2mQPQ2zuAiHyn3W
	jLOXDCN9CcxK1g9VfLJ9v+rj2ARxFE66R+B+Y4VjecF60XEOyZ8pMdKDsX9YzWhNvABS605fFJap+
	uhbJTFRrS8CFnPjo2TMfBOkM12Cngg4+IeJEqky8NQsZru8yQIVHHxI5Md9cGncWStE+BejADuNOE
	yA4Hk6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHKh-000000013Ho-1K6p;
	Wed, 11 Feb 2026 21:01:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHKa-000000013Ef-15XC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 21:01:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0C1340E05;
	Wed, 11 Feb 2026 21:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E18C4CEF7;
	Wed, 11 Feb 2026 21:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770843661;
	bh=81vYoliXZmQPM4sljejuzft3uMpQt89btl4VFLCbsSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQJz0tKo8aUeXh6TkvYU1vU5JK6Eo5iW1nFylPT/CahIe4nbYOSMhke2fXXiCci/l
	 oSdm/vdR0/CI2NWgW5CyF0Lnozx0EPbaP12Gg/RWwVyWXvJXMoEfcw7eqij2yjZqG3
	 nPB8kCoNVQaIzSD4eXOiZTYBJO1FIbxFHNkKTSNlLALwEOPGHBOepWSHXTt14sE8+v
	 KLzx8ccqEXjfyVnqv1rCBLNbHwRGFA6/1Wty3T0OXWMzl71d+PlXb8p3yQ4vZtIZEj
	 q+sf/PXrqrDSSLoHdT+VYWVxMOxVF9C1M2O4l+TbDWzoNI0oMlT3UsQJ/dISCyiHsW
	 FqSIUqM8Hy9Jg==
Date: Wed, 11 Feb 2026 15:01:00 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Will McVicker <willmcvicker@google.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Juan Yescas <jyescas@google.com>
Subject: Re: [PATCH v5 02/10] dt-bindings: power: samsung: add google,gs101-pd
Message-ID: <177084366016.3875481.12715667820083029736.robh@kernel.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
 <20260205-gs101-pd-v5-2-ede49cdb57a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205-gs101-pd-v5-2-ede49cdb57a6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_130105_038253_876706DE 
X-CRM114-Status: GOOD (  14.64  )
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


On Thu, 05 Feb 2026 21:42:30 +0000, André Draszik wrote:
> Add support for the Google gs101 version of the Exynos power domains. A
> new compatible is needed because register fields have changed and
> because power domain operations involve interfacing with the TrustZone
> protection control on newer Exynos SoCs.
> 
> Power domains can also have a power supply linked to them, so add
> optional support for that, too. It is believed that all (existing)
> platforms could benefit from this, hence it's not being limited to
> gs101-pd.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v5:
> - add domain-supply and update commit message
> 
> v4:
> - add new vendor property samsung,dtzpc
> - drop previous tags due to that
> ---
>  .../devicetree/bindings/power/pd-samsung.yaml      | 33 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


