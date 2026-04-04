Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744C7E88D80
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 10:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVI0gjN4ggle9FRj0azH8ETQFgO6XAT3wrYzemDx5lE=; b=4hgMsmu2QxaxttxDbyKpGz6R3t
	FeC0RO8D/erzUqsTaNn41TBehRU9+/f2bvDjOPgsJx/+BLwrXh2nwhbL/FztnQAo26CCj8n8c8IXj
	Fu3q6dYeyL1aW4aVk0ve1LHbjhOL1NcnJkzxol8GDfoqP2y+FicdabQW6eXP3TII7OmVO6Oc755RI
	HBzZE4ui28tLRTHHNn+KApFTVP3oitoZRG7LHIJK35NSICPAyJIKR8qkb0p07x08lg6DB5/xtQz8t
	PXdrOYk86AeXALj09WEGQdiCLVAKgpfBUjTkebjZXl8LFSAoAHDREaBrtWlnZg2nGF+uv3q8Do2Qg
	qh4Am5JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yaX-00000003Obd-2WMS;
	Sat, 04 Apr 2026 10:50:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yaW-00000003ObX-1okz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 10:50:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 955F960008;
	Sat,  4 Apr 2026 10:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8484C19421;
	Sat,  4 Apr 2026 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775299847;
	bh=XlV93qt8XxCZGBNC86/HRqHqRPWS0RQnPhDy2NL8/VA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvy7ergdvQvaay7kV3qQWauJcg/3sL8wHUNwYoHNmuMOtWWZT+CSy8fzUdoAyj5XA
	 im6n5mdOd9xfLx0XSwv05Rac5aRpujCigBYkNPphd0uZl5Luz9tgz9RLcaq3u6l7uN
	 daY/acphESIcmLfti0Ic3e37xelWgO9E/gZ0suYA3pdPPEugWQN+yT7SlI/UxTURD8
	 +iuoED22jDHZ07XsD6OYydgo8c/lO8DDgdp7+p11E9UZMn+5GPA4Yu7sqKjgZKQ33g
	 NW0PFWPLMO3dMo6iVbc2MzT5lab25QJW9f+xMAjcryQ8z2WdK0MmVkoOhMBJqd94KX
	 qJRrKYCIYwEnA==
Date: Sat, 4 Apr 2026 12:50:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Robin Murphy <Robin.Murphy@arm.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: Add compatible for Hawi
 SoC
Message-ID: <20260404-hissing-determined-doberman-fa1ab6@quoll>
References: <20260403080956.2714415-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403080956.2714415-1-mukesh.ojha@oss.qualcomm.com>
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

On Fri, Apr 03, 2026 at 01:39:56PM +0530, Mukesh Ojha wrote:
> Qualcomm Hawi SoC include apps smmu that implements arm,mmu-500, which
> is used to translate device-visible virtual addresses to physical
> addresses. Add compatible for these items.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


