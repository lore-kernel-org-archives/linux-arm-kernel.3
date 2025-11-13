Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B36CD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMkzANVm7aHYD69pohW+JsqtjRDO6+ch/nFFgOOKUGE=; b=xrAH7u9LHXoNLyt6JQg5CP/yfr
	IOPNBYQAKXUVRzKLqdiZa6M2ljtXr8/NFxI6GBFnkrP/2yRjpC/j7oyJoXj3vTT73HG/3UGaiAZrg
	aYTlNgF0ViBvVVNITWtyPbZ4eNnLai9l8e9CkR9vO1BpbEqU1kJ6/gssg70TmUdwejinSms5vwo46
	BtuZe5Qa+olASL8bcRMngw0nNGO4HjEFyNH1CCHXGV0RWDfeBGVJdFuiIkr8zlP2oGJCfHpq70ZWT
	CdQPObzqhTVZKt6iKiYjhOKnz+vX2ucEvxI/3uVieW8+a+At9M7LjBsgKZq01A6avzNGL/uHcjaB/
	/38rzJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSal-0000000A5lv-0mh8;
	Thu, 13 Nov 2025 08:22:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSak-0000000A5lk-0Eys
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23252601E6;
	Thu, 13 Nov 2025 08:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE74C113D0;
	Thu, 13 Nov 2025 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763022124;
	bh=q166VfWGOLQHZ0C2z1lln5Ct56mqXInjhI++VoiZBBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka+gqp4dBFWlBUrv9DoyTbtsnOwdJxgAreQXp/b0agGH+6+FkL3FT7YnZRgNEdDzW
	 OJJ3MR0fMRR4JokhFRTdGtCGfSgmz0iidQIOzKdQTURQdfFesobwhqwdL9s8MW8Kb5
	 2/CZaJ6AeMVKXaJN8QoWv+AvkF52CSPa5OSk9PfNy0Sh7nbZjBCvg/hOZ1y0Y7yG5e
	 Pnw8zf72AMqLhxD9QlnDdXw3QQgdiVOHrNci7otlWWzmDJXtz6JtT5yCKkwaSYsBQT
	 GbfzSH9ewjJ2RxOiGGK07UuFSzqLbR771nugYumHZsI8bPOMoN/82haETnN4Q9GOg5
	 RtUm5o4uJhdlg==
Date: Thu, 13 Nov 2025 09:22:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: nvmem: add google,gs101-otp
Message-ID: <20251113-noisy-lyrebird-of-enrichment-342e9e@kuoka>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
 <20251112-gs101-otp-v2-1-bff2eb020c95@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251112-gs101-otp-v2-1-bff2eb020c95@linaro.org>
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

On Wed, Nov 12, 2025 at 08:29:05AM +0000, Tudor Ambarus wrote:
> Add binding for the OTP controller found on Google GS101.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/nvmem/google,gs101-otp.yaml           | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


