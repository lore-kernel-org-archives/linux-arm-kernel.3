Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B30D13C3E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qER3NkcOuEyAjyIpZH7AGBR9sheUq9vF9xIv2/imwQg=; b=T2M79xM+23lVhISiHETRnRX0Pt
	dLfHWAsQQT9dqigHPIevhI7T+dyau9qJcnrA3SUtJE9DQteTs4ZamPtXPIpybnddDlIkySxO+v4OO
	QYDiUWcoJXVri1Nwj2gTeIpZ6evMYN/TtlDcYLR+anFg/iqTDm56jLcsL25JJVZ9dxAVKxa/1fY9+
	75wVaFXQwclIfSnhAw39CSffn5esJv+Dha5cG8wqHj8cZLFASKUtBlZ235TYgf5LDQnIsNGBeTR+J
	AmHMuK2SdfF7RBe53jjtl+teAPqH5SdlqJkCgmmHBf3sR74aJZbdPMuyc4ZGNMz+RmXNF+RAOoUjW
	qx/vSnnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOnP-0000000Cn22-3Npf;
	Mon, 26 Jan 2026 15:46:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOnN-0000000Cn1g-1CvQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 15:46:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2922441EE;
	Mon, 26 Jan 2026 15:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A986C116C6;
	Mon, 26 Jan 2026 15:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769442387;
	bh=m6VOqcjWo8tBPOpuIjMbZOW9+OCdo4xNj+P8hCC75V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lNaDdeL11OUsF5viXYL1IwouUgB7VrFTpZR2gPfGWMq0brhySedMJCXAUKkL1oM39
	 wP9HoCEuEoEyiQokQwoD8h1Ebr+/enmhJawsrqOb/aQxJMo/mcXnygnaC/uxH8R8RQ
	 I1i5cd3s1dtD543imMLHEYolPzQ1yf+jOUuSsZ8s287o7fJbymp4/NbTgzuLbgL2gR
	 7XQ+e3TfGW6SHV1wPPrJ9l7j9YaCjCBXFPu/DC6CLtivPyQrw70SJ7PyxXuEYWLrk2
	 Hf4BoExjxNrK/KedQ4c97DLN7eVS8+jTasjSfPZAGCrmkwLRaX7jo+GEOFtGMtg3MR
	 L8vd0QHndqhkQ==
Date: Mon, 26 Jan 2026 09:46:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Debbie Horsfall <debbie.horsfall@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: Add Zena CSS compatibility
Message-ID: <176944238565.2471673.8283438877437876056.robh@kernel.org>
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-1-34adb95cdf89@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-zena-css-v1-1-34adb95cdf89@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_074629_368629_E28F0DD5 
X-CRM114-Status: UNSURE (   8.68  )
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


On Fri, 23 Jan 2026 17:37:46 +0000, Debbie Horsfall wrote:
> Add compatibility to Arm Zena CSS Fixed Virtual Platform [1].
> 
> [1] https://www.arm.com/products/automotive/compute-subsystems/zena
> 
> Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
> ---
>  .../devicetree/bindings/arm/arm,zena-css.yaml      | 31 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++++
>  2 files changed, 36 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


