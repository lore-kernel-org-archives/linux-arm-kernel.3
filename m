Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CED8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CejnVPZzFYtuxGknERakLdEdNnWOfsAkP16dCJtWkpE=; b=kJO/uScocnVsT2j+mw/eUKHPbt
	+rjpLpkWFrrEq7rSlx7AM2nuS4raZHLPQoO62Jp3dAyVWfTJYbEYh80t/gRf9zSzKt+XLaj9rJsAN
	ztUnbud41Zsp92YommAgNB38hSz91poSZVbx+ZZGG3kgs/+X92tVIkmCKwvucyKkw7aZjUfXmTI+T
	+l9b0hOTbc5CePt7wPk6mGP+gVboHn1qzffn7WYfDHeG/3WRlw784b0H2dr1FNocr4HpF8hfbn4LQ
	zqyrpOPCRRzt+LPScgM+WirMsd5xlmMwT8UgQaUwwYr0A/8A24DmatptGZP7xXy8nwS5lLnxu6u1Q
	U3VSoUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNhm-0000000A6zD-1R9E;
	Thu, 17 Jul 2025 12:27:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMBq-00000009uBI-15im
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 10:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94BCA46128;
	Thu, 17 Jul 2025 10:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA402C4CEE3;
	Thu, 17 Jul 2025 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752749413;
	bh=hDOjBV4YT6b3RAQ8NLSnONEpRqZ2nMDiso747uOSaGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHmQglIMgtIFLTii8jKa4YBbEFugy6Cwwolr3lxVU/Nz61Txj8vVVpatZRSmyuC4/
	 bTzmc5uY4MFGAzrD9NmfTM41rQAYlDhyPpQrbmo3AFkQ10QWBs+Muwi5D3c1TsVJaD
	 7oFoF3yceSdlqFL0fvDzUf31HXvJD9lDQ3rHRwxlGQBaBubJ/+87BX9ztKKEjSxIMf
	 xRDhFO8cLQijI0GHMFgMyp6p0pdkqET8Hsqx02pRt6KUsKF80iNy6SkugpKqDK7s84
	 avmoc4IDpzo7sIzWEfJr+1jcooUXobW69IudbTcXIZfFrdwZkF38fsRNterj5rdZcQ
	 dMZfrrJAd7DIw==
Date: Thu, 17 Jul 2025 12:50:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, jassisinghbrar@gmail.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, maz@kernel.org, sudeep.holla@arm.com, kajetan.puchalski@arm.com, 
	eballetb@redhat.com, Guomin Chen <Guomin.Chen@cixtech.com>, 
	Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v10 8/9] arm64: dts: cix: Add sky1 base dts initial
 support
Message-ID: <20250717-arcane-didactic-dachshund-db7619@kuoka>
References: <20250717072209.176807-1-peter.chen@cixtech.com>
 <20250717072209.176807-9-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250717072209.176807-9-peter.chen@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_035014_320226_A5C61D8F 
X-CRM114-Status: UNSURE (   7.27  )
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

On Thu, Jul 17, 2025 at 03:22:08PM +0800, Peter Chen wrote:
> CIX SKY1 SoC is high performance Armv9 SoC designed by Cixtech,
> and Orion O6 is the motherboard launched by Radxa. See below for
> detail:
> https://docs.radxa.com/en/orion/o6/getting-started/introduction
> 
> In this commit, it only adds limited components for running initramfs
> at Orion O6.
> 
> Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>
> Tested-by: Kajetan Puchalski <kajetan.puchalski@arm.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


