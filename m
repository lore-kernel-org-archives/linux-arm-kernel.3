Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54995C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKuBmxQ8JnReynxOFnIhAbMgNLWozbwQA/XogGS5Wg0=; b=GXbwNSOYzzhUm7hJ3xv4UHP9TT
	XQA1q21Mo+1mQiNWr+/9UjQKwAaxG6mKIH9D4Q+rMsDASkv7Q3xi0P269pR3x6a6mAkYQjIo0i3O4
	4x64x8VFKGbuZLWE4WZigHxa++Avqre7OWrM+B8VEbrGG2QnxQ76HTmz0BodTbHX9bD5yLTzhyKWa
	msm8BL99S0OFAJBZnSoclP+2H72wqmFBBzs0MPy8/MeLuswRlVD2WU+5q1pk6cUCvWCUbUC29kTPy
	n8xOttO/urUBAJ1dvj7yD9N5YCtrthdWlhZ/Z56jRbZorOJFZ7B3p8wW6VqIAFju2lyI/30qgmFTk
	ZsytVW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfer9-00000007G9V-0Fu2;
	Fri, 03 Jul 2026 14:27:03 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfer3-00000007G94-3O68
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:27:01 +0000
Received: by chaosmail.tech (Postfix) id E47031CC21E;
	Fri, 03 Jul 2026 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783088814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKuBmxQ8JnReynxOFnIhAbMgNLWozbwQA/XogGS5Wg0=;
	b=TU+tJkDB8A+jF6w/GXb8peZBii67lRfq1fEtlzuSt6mglAZbbU23DaZiCXxZQl/KGU7SGr
	Ix0bQX9x99yQ5wJH6oPtozF49LXN1rhCvgs28k3bekzPY75tv+GSYsT/dKd8lBJ9Hx6yIO
	dEBy7ydKaLP40tT+f8XXgrq7FXrVbD4=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] soc: apple: Add driver for Apple PMGR misc
 controls
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <3e7a26e0-5ba5-4440-acd1-ac9547e1d403@kernel.org>
Date: Fri, 3 Jul 2026 16:26:43 +0200
Cc: asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Hector Martin <marcan@marcan.st>,
 Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <4A1676D4-8B60-40E4-8E21-59DF4657BEC6@chaosmail.tech>
References: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
 <20260703-pmgr-misc-v2-2-4b26ba10c5a4@chaosmail.tech>
 <3e7a26e0-5ba5-4440-acd1-ac9547e1d403@kernel.org>
To: Sven Peter <sven@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_072658_309895_FE15A572 
X-CRM114-Status: UNSURE (   7.53  )
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

On Jul 3, 2026, at 16:19, Sven Peter <sven@kernel.org> wrote:
> 
> Do we know what 7 means here? would be nice to also have that #defined

We do not. Probably a way to pick a clock multiplier or something
similar. On t600x, setting it too low results in other blocks failing
to power up after sleep.


