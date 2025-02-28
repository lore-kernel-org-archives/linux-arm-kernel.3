Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA9DC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 07:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmy/HVOfQUuQwruCrtfVOrMj59vHNJUBwE6te/uNFCg=; b=hLFyoEo35JmqgLJxpwPtzi3Qk2
	eBFaj36Z5341qOTv75ABGsCCP2zCngR7eCLMhBnT3+ByY41pYu/dTQ6AcQfQBp/pz8cG90sn53Vjz
	XWpNWeZjVHHrgsYPlz49GwtOHcrTsZzjx8i70e0BqqxnQjgsCXRiRdrpCB2SHEIryqJoUH2ZOuQzQ
	WvTRWqnWEgckaE+dsMc96NsZaeISU56OLPP/98m2mexn0YLjCt2gnRZHazIO8RmCspVXboiRs2dr0
	Wo3N628pGsIMtuXLjUs4G8TwxQ4ZrH724WHGWoxg0+k19ZwBG0a2yYyZIHyer5cemOzO3xgdZtfoI
	QjzHv3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnukB-00000009z8T-2VEc;
	Fri, 28 Feb 2025 07:25:11 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnuid-00000009yyM-3WvV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 07:23:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5BCA61F41;
	Fri, 28 Feb 2025 07:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61D1C4CEE4;
	Fri, 28 Feb 2025 07:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740727414;
	bh=FySeXdrRimFrLVwqw1+E2oUqxSwEtboPGGyAWNpiM8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BxlI25C8FPop0ydCWps70MR+y6z76vAm2/cmEbbvriw8jRoYW4nteDqzBhRlHvSW5
	 EjwliWi4pQJb9u08ilDAtoT0VjlGKJo3+pCCu4mUhO0eOr+k4T6cqrN+IEWA9uf7Du
	 A5rNn2+ixyLpGcVQYcFII68RThKSTEvPzPyp1J/9QjN+2fFAensv9Y8HUxMWPKzc6w
	 ce3/EGPnt9CT0VUF4/KCuO4cgtUln63CjgUctezHut7tNjEeAduuc9IPOjRLQTrs+L
	 k4CyYDl2cIoAXXEgkVYgZ4H76fIp9QhfkICdYTCIe3tqDJfLCW5Q6GSZBu2VDzJw6M
	 yYB7OMke3AnNA==
Date: Fri, 28 Feb 2025 08:23:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, marcin@juszkiewicz.com.pl, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v3 4/6] arm64: Kconfig: add ARCH_CIX for cix silicons
Message-ID: <20250228-spiked-spaniel-of-painting-c5e5bd@krzk-bin>
References: <20250227120619.1741431-1-peter.chen@cixtech.com>
 <20250227120619.1741431-5-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227120619.1741431-5-peter.chen@cixtech.com>
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

On Thu, Feb 27, 2025 at 08:06:17PM +0800, Peter Chen wrote:
> From: Fugang Duan <fugang.duan@cixtech.com>
> 
> Add ARCH_CIX for CIX SoC series support.
> 
> Signed-off-by: Fugang Duan <fugang.duan@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  arch/arm64/Kconfig.platforms | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


