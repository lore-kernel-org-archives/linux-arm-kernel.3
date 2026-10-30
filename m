Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7799A606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gD319oXV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6wz9Fxz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zxZ61noBemOEJ9Z/Swm3wSwkY7NkjJ1S3EShVMj989I=; b=gD319oXVDGJ14of9oe+e+ssFki
	NkRXrMz0ckCdLiIjm9SXX2yaC5G47a2f7bMMf4yB37ev8xnOMrWypgHIA+ifcJxY7zUx/KHftD6lQ
	0aGLtBnrGDw8kfilsb2wdjtYsOQlhZuPRIHiFuQJBKg8gYQagePNcascB/PIYUchdrU+p3mtfkvf1
	aabWFtwnFlMQvBhKXR+APLjqmunKYHc70CrpVsE5nv3CFjhmKhkRw7fbLB5KuMLL2y1h5rPRfg4bf
	U3JooyWYIvJmgqWSgA5AtIUx74PJcF14g+gAvzG9VeN8HIZD2wFn752MvSY7v2W6fCq3rpBW2R+IE
	DncmDYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkVl-0000000BVWo-0dru;
	Fri, 30 Oct 2026 11:11:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkVj-0000000BVWV-258K;
	Fri, 30 Oct 2026 11:11:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57099602CA;
	Fri, 30 Oct 2026 11:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD301F00A02;
	Fri, 30 Oct 2026 11:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358662;
	bh=zxZ61noBemOEJ9Z/Swm3wSwkY7NkjJ1S3EShVMj989I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B6wz9Fxz6TcjWK5RVkgW6OK/pRylEpQuIfP6QSdziPqzdCOAuAFyIBvq/pCr7qsw5
	 RfgaO+FBxRrCG1LU3kErftUbiB6gvDTvFbV9W2hBdFTN6jk77WWFZaWZwIcYvxammu
	 6jzm1CHzHKNkesPb1ERuda8+n5pEP3J06XSRzDXcmJgJmrk/r4jGn7QcrpLsEwqyG4
	 Z5lzbOp3Y/ycXRLdiqX2+jnRxPjswUlwyzi/o1OKjnruDxpaDCMUROAmawG2BmSc43
	 Kroj/hsVhjz4f89dQrGEs8kFHbFad30/9x8vNTJMEZAtZeHOS0xXIDEimf/9MEE6Hi
	 /0MUq4weqCK+g==
Date: Fri, 30 Oct 2026 12:10:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] dt-bindings: phy: amlogic,g12a-usb2-phy: add S4
 compatible
Message-ID: <20261030-chihuahua-of-perpetual-current-1d40e3@quoll>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192202.209045-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261025192202.209045-2-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 08:22:01PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The S4 USB2 PHY is the G12A/A1 design with a few different analog
> settings, so it needs its own compatible.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


