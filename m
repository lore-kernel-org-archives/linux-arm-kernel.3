Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A32606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s6mTOBS8;
	dkim=pass (2048-bit key, unprotected) header.d=shazbot.org header.i=@shazbot.org header.a=rsa-sha256 header.s=fm1 header.b=M9tHlslt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ha+Oa72J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEC5wGdX89Z82HsqXlE8mmJxfZaarGVbOVnr3hOAm0w=; b=s6mTOBS8/Z20RSXQhUpY8DklOc
	Bz+1oEbZghbIN3nSDa11O0zj6dZuIyJWECS2SBkv+b9VYoKO/ByHQk758l2sxZdbyht8r21/P+qkZ
	u8D15N729q4HiEU6xaLRJ88m9ytFY4bBBjBaXW7EzLrLwSi79V2yFlyX3PRBB2Rzl9TTaazGXW6FE
	IqFCUoFGbN8yPn45wFkEPjJz5slimtUU7u00gNdWYcqggYM99tyfDcUzrFqjIrspL3NBl2gav9y2M
	0S9G8OqE4GH5JPA0zU4EuJeyGu/eJpC9pQlt0NzVCqDjR1OHOtuNp+DSp5raXp1/wZdj+mQqCVnMo
	KWm1aNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBXA-0000000A2SA-3vuz;
	Tue, 20 Oct 2026 15:13:48 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBWz-0000000A2Qd-3Wr6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:13:48 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9D8947A010E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 11:13:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 20 Oct 2026 11:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792509210;
	 x=1792595610; bh=ZEC5wGdX89Z82HsqXlE8mmJxfZaarGVbOVnr3hOAm0w=; b=
	M9tHlsltLlgw8brJIvmPNECIIqpgNSnV9Aufv+9Q/YQR5XCQxNS74hm7X+uiWKf+
	r2RQNVFAkLu2UCbxuGYFHDOF9/v6jUpjNfYZ0uFnXRW1ErREow//PtDs1a2LgszU
	pmrS6MQ70VSK5S5/sDWERsbWHCE48RDZz3xOQyhFs/nwOfBji48iH3bcHi+FloAu
	0m3UNrWCg/A2ZVa9fhdLU1ivMoup6KWo0gqQeHZe+1OEw78Vl9fZrN8S68hcb3PC
	I2No/U/KESQz8ffh4/L/YHalR6jT4wNDjnFtymJh42yuFhoaON06Zjz4mcqk5zfG
	2zGSRmcFt/DGqQbYdvmz7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792509210; x=
	1792595610; bh=ZEC5wGdX89Z82HsqXlE8mmJxfZaarGVbOVnr3hOAm0w=; b=H
	a+Oa72JoYaPNulergz8Vd5ZAv5El0DBJBfPwrT+W9h87CrR4EofXeAGQX3E0G8kC
	NiQcCMrK71JtdrEhr0WY4qf3HSwYX7eC4NCAGq6YnNndrUH60nBjsCdZbgbLXLMe
	XkKDuk2l6F3U5vDa7KX2xhn6V+kOvkCFnIFY3DYzCOMHOEw4Jgw4BsWVTwX0vK+Q
	dILdWkR7Orx4djHrH7CnxQQewKfc7HBcxmu+hLFijP6CBsAAFecryEnzMJ7ZA9iN
	Gu9qeRobLTJhRFK/WJNfy6uC58RIu3x2u8nt1voGG0wbZo1Iiqdvtr1P8qImJcoU
	sPwUkVGgGaJ0TiTA/4uRg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=shazbot.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792509210; d=shazbot.org;
	mf=PGFsZXhAc2hhemJvdC5vcmc+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:D0yBdhFTqwY+MzpTTMV1epQcGXnvFqZ7044J3khik5imwQO
	8aBJhdMnOoBsPK0ZR70WT50uZJsX6ciZEvsvUuuhKljCpnazgyU6eeq+9YG1/1PP
	b4jCG/ImSE2cBnppInNCOL+lgVqsGvXbN/MEwkOtvK1PvchQ+z7loYaIxZbg9Xk0
	GObvFtbgXeiZNMmu2i/sOE5vI9yMEPlNTVgg3JQeTtfpX0TTV/9v+pRbruRr89ZW
	sCulNEdZjjhqHrLljc215YTpAMljEJB2jtdxDZnMiHQCd9XIzI27S4i1tc/g5ZDZ
	g6dl9t1pGXajdlKDECKL8uU4WhaBeQT/3QMtPyA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:x6UoH16gURO7uNaEzSVSnnyT7fiCt2A6Q/EVxz0TqeY=:k2n1M8WM0uQ8ddJeYsWll/h/e8ny+5RBdyAfFdbkmOk=;
X-ME-Sender: <xms:GoXXauZvwpfFcLL-YMIeiPXMeN17TKhhuiTr3CMrjX7NypTaKMea2g>
    <xme:GoXXalWQhLgflFFbB6B7VSrcgA4XQG8sa5_CxEqQ6lkAYxvJGNydThokHEt0Kd6YI
    3G9IaxbzymGYWRvC-4yTRh9IeFWnvcfeoS0FzTMQ4iNMehmAeOm3N8>
X-ME-Received: <xmr:GoXXahcSN7dhSBTrJ5jB2YSaOXAisCe78Y6qrQbHkTU03YAv7z1vz_-sSE28gg>
X-ME-Proxy-Cause: dmFkZTF781+OrsKyKgKiRJR6hUf4rOKz6QH6MhRz/dGUsBKW8dVXANdVTYJvd9I2M1Em0J
    ntb8Q/VPXfsQlOyOmgO7UlmKg5nlLjY5MLTCPVBXDZzwpfNXtJQBRqG+uqKNvnimFs8omX
    NbYKPofjgmmrHKRQ0PEt5abTXCvDu4QqG+70LRFtPhbTp/bF4uSYRUEpL0dX/M2KtG2fIe
    6TzxzRRfwdRjIOo/0ePJqF7Ghyyo3cSRbJQTfr3gxXCMrDRnX+ycEDsPYiNgVbs7+WvPTM
    X3rwBiFzgyUOnVb2VpybTiXuIO0AhiWs4CBKeRku1xbRknd0b7OrWBGur3xBRANIiI1oq9
    l/fGSakfL3BFWEPT7znvBQdywUSL/kPWJgL3lbAMFwNSqYatJdrVV3l5JbF7Lhtz06Ad3e
    PQojYG/WZYeJlGLA/mztvHnREAEblQOxi8hx/ZXtN3QTOk35uDKc7Bjsy4Xraxy8NVzccu
    uFOc3MsykYs6+Lip7NFlaWELQAfel3Iv2V5Mt4HvmsuiQFiak5Z4tgGYunGaaMsOauzlX4
    854Y9f0jyIQ2v0k0CG0IXcMgVYstJbrVFWOIihDISbxvK9r6wvQl63OQYlndnzK3cowV+G
    DmtRKn9F6h4n+7wWgrswuN+oGLDoc8QFjojckSCCgUatKs1k4QjBf3FH64PQ
X-ME-Proxy: <xmx:GoXXaqNuw42NB2jAicJhqF5QvCRhyjKy-GoGfoI8Fxe025FPzU6Pgg>
    <xmx:GoXXahLgqBhkSScTPmFipkJPPQHMlew9D4bDAKoS_AXcNQ515lqG3Q>
    <xmx:GoXXaomlGGWPhmXIZAXwmKp_Uvy-t_uQxGt-apbJ9OtpEuQlV1ae5g>
    <xmx:GoXXaoa3dOjnfc5WG1PvG4M_BAUlXRn_sl-SvPAVK_HO4xI25lEZaQ>
    <xmx:GoXXag0N2CAD-RSrji3mMAh0jPzDb8JkTsDaC3weXSh2ayhT8aeibPXS>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 11:13:28 -0400 (EDT)
Date: Tue, 20 Oct 2026 09:13:23 -0600
From: Alex Williamson <alex@shazbot.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oupton@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jean-Philippe
 Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 alex@shazbot.org
Subject: Re: [RFC PATCH v2 12/15] vfio: Support VFIO devices that access the
 CPU MMU
Message-ID: <20261020091323.3c51258e@shazbot.org>
In-Reply-To: <c367caf3-d462-42ea-b482-bf9c51c47a63@arm.com>
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
	<20261015142552.4128028-13-ryan.roberts@arm.com>
	<20261015164421.GD13920@nvidia.com>
	<95e0f9bd-0203-4c7a-9d09-622593bb3d4c@arm.com>
	<20261020140944.GA3008132@nvidia.com>
	<c367caf3-d462-42ea-b482-bf9c51c47a63@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_081342_904632_5E55D9E4 
X-CRM114-Status: GOOD (  23.05  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 16:06:37 +0100
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 20/10/2026 15:09, Jason Gunthorpe wrote:
> > On Tue, Oct 20, 2026 at 12:51:26PM +0100, Ryan Roberts wrote:  
> >>> However.. you still have to affirm which single mm is the mm that the
> >>> device is going to be doing DMA against. The process the opens the fd
> >>> should not be forced to be the mm that it gets linked to.  
> >>
> >> What is the mm representing here? Ultimately we want to install the KVM
> >> instance's stage2 pgtables and (pinned) VMID. We currently get that via the
> >> bound KVM instance (which looks like it still works using the cdev interface?)
> >>
> >> The guest will then install the stage1 pgtables and (pinned) ASID associated
> >> with the relevant (guest) mm_struct.
> >>
> >> Do we _need_ an mm association in the host?  
> > 
> > Ah.. I see, I didn't quite follow that. OK.. Ah everyone else doing
> > this is using iommufd with a viommu to establish their connection
> > between device an KVM. eg Jacob Pan's series. That's a probably a
> > better idea to stay aligned with the common path. Though your reasons
> > are a little different..  
> 
> Just to check, you're referring to [1]?
> 
> I was under the impression that I could open the VFIO device through the cdev
> interface, then bind it to the KVM instance via KVM_DEV_VFIO_FILE_ADD... Why do
> I need an iommufd at all?

The cdev is not unlocked to actually access the device until it's bound
to iommufd.  Thanks,

Alex

