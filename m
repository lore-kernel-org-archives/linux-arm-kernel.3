Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DB5CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTHczNh5onmLp5g+RNC4zwxe20ZSdQUfIQ2nnv/nAR8=; b=bRoHU98C3jzA/I6UoAXXDyphHy
	h5BelNC6HMym8UYCf1fpQcvzUjxmnjc4banYkdK2lmvh3puY8+wKJbM4LIzuKfwOsis0luplBjn8X
	NW97myV9BUTGcsqc+BSf7ww+K8/Zgl2Sz8oINtVeaPN4u9qg3JduUwYctVb9/TZxRCmDwFzeKMfCl
	4GFZPVTP/2JYPIrC9Fe/2UshpT8U05UGbFiTCqpkupDg8uuvJbejcDZeMDh5E0T5nFKpiD+1SH80t
	RXelvDzpsmGvgHdJkRPmBDJMVXX+qs1F8oZxosutG9Vjmv7xPEK3+yQ1oZuIPUhnxweXCOU7j3gPE
	J6kPCNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxoh8-00000001hO8-3Bqm;
	Sun, 14 Sep 2025 15:31:14 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxoh6-00000001hN4-18WJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 15:31:13 +0000
DKIM-Signature: a=rsa-sha256; b=sZ1mCNjcLb8O2Qs59Cgdi8XQmIr2zW8QpF5CXjJPHyYByVdvUfVvzRgrihuKmNY/gYoA2JmFMg8M2T0Gv6U1KFyAZ0s4dZndid+uGX9lC2dFypRRiVGVjYUD1q5TufnXjjR8VqDjBv7+pAEzmdDyPcAGLFDgfEv6l6VyP0XnaQXE72u/OQZtPky2wo2sgEiCdiJxiZawzx3cULzGA6tWhR+UpwjV9hiFnO7djPIvlqPohg7VuWhRn0jFcbHOuYciEkzTolCo4EZehlDWnNG/nGiSrTH9lfnKfo19qKNP7kVOZ2Ol5igXH9o3zt4qib2829ZjTFgJ0HHDgw8jMp6uvQ==; s=purelymail3; d=purelymail.com; v=1; bh=dTHczNh5onmLp5g+RNC4zwxe20ZSdQUfIQ2nnv/nAR8=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1797260638;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 14 Sep 2025 15:30:46 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Sep 2025 17:30:43 +0200
Message-Id: <DCSMQ58API63.34STG82T6E4N6@mentallysanemainliners.org>
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Ivaylo Ivanov" <ivo.ivanov.ivanov1@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Tomasz Figa" <tomasz.figa@gmail.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] pinctrl: samsung: add exynos8890 SoC pinctrl
 configuration
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914114457.2610013-4-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250914114457.2610013-4-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_083112_387581_B0CA2501 
X-CRM114-Status: UNSURE (   6.49  )
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

Hi Ivaylo,

On Sun Sep 14, 2025 at 1:44 PM CEST, Ivaylo Ivanov wrote:
> Add support for the pin-controller found on the exynos8890 SoC, used in
> Samsung Galaxy S7.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Reviewed-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Kind regards,
Igor

