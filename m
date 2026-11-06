Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0211B606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D25Y5IE7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TuVLNIC1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JjNTyIpsD0vhIknxm9oFvMY1a10mRNqNJaX39V1v6Vk=; b=D25Y5IE7OklJ2d2x0BmOrn2e/R
	WQumy6PHzW5wQIf3axBPFOcdTd90bDSWWteZxsFguk0mSzZuXIM26eN4zuTMYMEveIdmviYd75Beb
	RG/zZACHMQhKceBFsYeuua/g+ayfgfwN2PAyA1VT4ifN8jbCduSFgLdjgZ7mk8kFVlZI9XXyCHCGG
	qr1gQpreQDT/MnrMLDwWyRHRGZv695nl/zxPW8gviiT0B3SJx6JdZtpTct0cai8IDk00Z2a/IpqGO
	cYid5rYEhjbXtZ75APdr3nt7rj6rYz8kOdTK//SLdoRNR7ygCoCXkqOQgXhXo5EKQz/ZEOzcudQML
	5E/gbyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJQf-0000000CMKC-3zxW;
	Fri, 06 Nov 2026 12:52:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJQe-0000000CMJz-1xNr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:52:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C962605DC;
	Fri,  6 Nov 2026 12:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920ED1F0089F;
	Fri,  6 Nov 2026 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969543;
	bh=JjNTyIpsD0vhIknxm9oFvMY1a10mRNqNJaX39V1v6Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TuVLNIC1x2sGzEiOW04ml49LmDYKCUXm/jkGVvvwEwL+eXgnMtZ92Hb9JFrne/uA1
	 DpXhM7nm7swma0juSd2QrxPTER665+mTSoIbL9g+UbDLyyNOdZ4efXmYTMDAHbOA4p
	 7W7TzD/tbeFNwZQWfPIC0zWgVbENvtdxX+FLZQ036BSrNnzp/RcZ0yV38jgIOCG7Pf
	 c34KFovB9A5CWsy2JX00dAD1LZIyjHjd+QHAeLMTvrwnOO1uFvaW9yRXxRNdzTa3lP
	 NPEpMNqGEabe1o6AQbP2S/+eiOgUivPB2tKxFlHSxIs6N/zUKqXAosZMTPwXhxz98w
	 3xVKyyYGt9Eag==
Date: Fri, 6 Nov 2026 13:52:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset
 control
Message-ID: <20261106-savvy-invaluable-gaur-7af1b6@quoll>
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105024106.338791-2-shengjiu.wang@oss.nxp.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The HiFi4 DSP provides a separate reset control for its debug logic.
> Keep this reset deasserted so that an external debug agent can access
> the DSP and perform debug operations.
> 
> Also require the reset properties for the i.MX8ULP HiFi4 DSP.

That's ABI break without explanation.

Best regards,
Krzysztof


