Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B478CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgysvuYQa3VryADSMxaUOkvnpUJJME8Z4Jq9WXkJPsM=; b=arpSZZ5LcuuApl7gIfE4UFn+vU
	metC59P2l4Jw5ZjcBWQV4mRQkutPTXEre0k2/S/iGg2lBJLQcIs9lEzUTRrSFOxzuXneSKfDQd/+H
	hxZQagKCR8gZBzkLCzWBUlfM2HCqDRCzWXc9zUcg7yrhcqf99zhkSA5Rke87xClJ0EYm+7wfCMaPF
	cXFUV11brz6rNxGl+2D1PgPfYhbHrNRGqTRW9IN4Se3pKd/aXrYeO/UoXTADyQHH7JcW9Ijw4iPO+
	jkz+bS2fRS+yHyBcyr9V6504e6fg4KP+VecH1FWDjh4VXM/uvhjgj06h//4+vo6KD1EWrjuATKzPb
	YLb7MMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHCZ-00000008eN6-1pFP;
	Sat, 30 May 2026 10:45:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHCY-00000008eMv-07Vq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 10:45:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D04EA600BB;
	Sat, 30 May 2026 10:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A011F00893;
	Sat, 30 May 2026 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780137956;
	bh=lgysvuYQa3VryADSMxaUOkvnpUJJME8Z4Jq9WXkJPsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LF9JPGAcC6moprVYRK0U4dFljJn/TPozotuwfFii37DICafru5Y1mAAgjlhJ9e06z
	 9SGRJEk5thzrrSB5IJNQKd6brcTQ0i/vBmArRmWoFmnG8h6IuAGYaSBDGy2KeeHqb3
	 Sp41R1Po7GEY/ZeRbsnKV++sgd3pGQt9tUuRMhu7US3dBNO5r7CB5VyVRwJnr4Al8c
	 MHlCGcQFBcBuwg8mWJ4NFaTiaXJr19gtPbFlA5LTJRtrez5KvxKH6r01ogiKGgWFoG
	 FNu+9r/srmgiu5XJJG3+U9i22Hp84uOarJ1iY7Iyp6T02UirR9FKPBxgThJMe9BrRu
	 Xszkru5qtrvfw==
Date: Sat, 30 May 2026 12:45:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <20260530-indefinable-oriole-of-champagne-375a1e@quoll>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522111849.783-2-laurentiumihalcea111@gmail.com>
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

On Fri, May 22, 2026 at 04:18:45AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Document the optional "memory-region-names" property.

Why?

Best regards,
Krzysztof


