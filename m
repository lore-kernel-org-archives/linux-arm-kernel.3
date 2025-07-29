Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884C5C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 08:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC0Y29y/Fp/+Xe1ebyM/jSSU4TFi7ZAl212Xvjd4gTI=; b=3X9chTNcbaxi5vn3LE1hzlq88L
	1of3Ide4mHzhLPKMQxtjixWKHFlnUodcCVFG1ieTACLoMSR5ArVyAy2kLf9c4KCfafRLTe/O/ggVb
	duUrzh76CxtC4LmO7rPTLiPMq4GKjpAZEuIol6k6eI5Cnf2rUiieYPWmKl27MZX/Ga4qikqP/hmei
	+GxtpbZADPiDTKj2s67KDPpRIkYNF5/pN7J1ovcJH6c7LODNZsZabNnNNMxWJHygPFm9dyez8/0jQ
	p6NSadPw11SMDQV2RMMvtIeDktDQ6UqwYX/GHpytpon/sMe9X8I20e/xWKy0RAzqNF2oa9ZrboeDv
	gNrOa/Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugg8C-0000000GJCb-3OI5;
	Tue, 29 Jul 2025 08:56:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugg11-0000000GIBe-0vaB;
	Tue, 29 Jul 2025 08:48:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE04AA549ED;
	Tue, 29 Jul 2025 08:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5106C4CEF5;
	Tue, 29 Jul 2025 08:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753778933;
	bh=JGzmTwYYrbI59qkPeNZItYLq2tGzPcEAIKyarJo8Rlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFPRWVqWozpr9+yoP1tCz7C0r6F52FrK7dKuDTazEJvCIQ/ZocjB72A2hvZJiKpKZ
	 ykB4j6BW7P2bMALc5s6VqnfC/y+F71CWEppBw5WD2RcjCkBOubl1mfUI9PD20KNDsV
	 gxwSpZPVMykmuy+24v513UKfNXnYnOFMZ6ge9nvp/oGZClFjKcbh75Q5OjctU5Yx31
	 7ps/MAUm0wbf9Nz8M+wD4NLziDZj2SkFUemYW2ENXoyeUtEhNv5o8LrVWwbCKz0Se4
	 NXzEM/aNINayGi/aGAiJQnIJjsoshMbJOeS0GHg4fctL6ROzZly3+CLHjXQ0nAJgad
	 kNlzKbmDBLvAQ==
Date: Tue, 29 Jul 2025 10:48:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erik Beck <xunil@tahomasoft.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Add Support for LinkStar H68K board: ARM64 and
 RK3568: dts and dt-bindings.
Message-ID: <20250729-poised-proud-ibex-5ab838@kuoka>
References: <20250728-linkstarpatch_v5-v5-0-b4ebfeaca652@tahomasoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250728-linkstarpatch_v5-v5-0-b4ebfeaca652@tahomasoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_014855_321388_BBD11BE5 
X-CRM114-Status: UNSURE (   9.55  )
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

On Mon, Jul 28, 2025 at 11:07:35AM -0400, Erik Beck wrote:
 v5:
>   - Responsive to comments received from  Krzysztof Kozlowski <krzk+dt@kernel.org>
>     - https://lore.kernel.org/all/20250728-dashing-discerning-roadrunner-bc8b87@kuoka/
>     - https://lore.kernel.org/all/93c39b36-07c8-4883-bd23-7d0194c50a7a@kernel.org/
>     - https://lore.kernel.org/all/642df1ee-5e92-4f0a-bcdf-7e10dbc0d59b@kernel.org/
>     - https://lore.kernel.org/all/9ebd9797-8d92-4799-bb8d-59a796e6043c@linaro.org/
>     
>   - Changes made are:
>     - Revisions to commit messages:
>         - Removed notes on base commit;
> 	- Fixed checkpatch warning;
> 	- Removed notes on device history;
> 	- Fleshed out the top-line summary of the dts patch;

You did more - also changed order of patches.

Best regards,
Krzysztof


