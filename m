Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCC4C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnsGKFuMBTOgjRQ7tE0YFIFN0I5+jqQT6Tbo+szNMH8=; b=neEr009H/FcODByMNbuCQGmkFv
	tUuclSdqKW+8c3yVEh8NBP4Qa/afW2w241xY9X2Cx56TpfQKvpdyaMIVHlKSQ/5mxGIkZBBJnMtuk
	ZQ3l5qjXJAuN2qLst69qWDml/GWEfhqUMOA3YG7ASUJZaQRsBYCVYXEtbmlll48uWM/2U/CzjAYJj
	OByn2IJk8Vdk+RpCIr/JW6KCVdg66zYvRu2yWG/Qc6/59OE7e1kfXk5dt3flZ+lHR6OKx/aARPkbl
	o4xcyzKYEExrJuNl194Ndps9/InZg6F1T+ff7iBHqGoVJqqz6Zlr5ywqBvOM1S/BkiN0ohyEQfnTd
	b3/0zakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB2A-0000000GVrw-1imI;
	Wed, 12 Aug 2026 15:38:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB1R-0000000GV4X-2V7o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:37:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF5C540DA6;
	Wed, 12 Aug 2026 15:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964C51F01564;
	Wed, 12 Aug 2026 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786549060;
	bh=MnsGKFuMBTOgjRQ7tE0YFIFN0I5+jqQT6Tbo+szNMH8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=LlCiLZHw3+ofYE4Ie3tuXkPweSejU6Ki5L0+yYDa/Qv43PLea15SMHIwyy387VJb7
	 EhxWSJevaftiZ0e/IhAjshZrl9hv9k9kwgyr9ZHwt6Ca0RI+bOuMrFYfeJsnQ2cS0i
	 pIgcDU9sSkDgJKRxKWN0Sen0G/v4xpfvk4EXRZDbswCmA35xuJhQSt0RFqpwPWKEPQ
	 QyKz2uCg+fdofZVWEwv0v/QORFdbZoPTQKl5HbFsZE+VfHeWRzgTlm+MndQgmV2aJR
	 1A5bXbbABFEL/DV8IkUUI7wl7nZ0J36ioHqsPN2vV0Y3NHuAuN1sPIoMsQZtGhylFW
	 cZt9nX9PIIFFw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260807155830.603972-1-andersson@kernel.org>
References: <20260807155830.603972-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Imran Shaik <imran.shaik@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, Qiang Yu <qiang.yu@oss.qualcomm.com>, Herman van Hazendonk <github.com@herrie.org>, Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Lin Li <zhuolin.li@oss.qualcomm.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>, Luca Weiss <luca.weiss@fairphone.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Wed, 12 Aug 2026 08:37:38 -0700
Message-ID: <178654905858.5862.417176047042178047@lazor>
User-Agent: alot/0.12
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

Quoting Bjorn Andersson (2026-08-07 08:58:30)
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-7.3
>=20
> for you to fetch changes up to c7d44572a85ae1b897e0bf95357439ee75ddbcc7:
>=20
>   clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra (202=
6-08-04 10:39:11 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next.

BTW, the free form paragraphs are nice and all but I usually end up
rewriting it into bullet points. Maybe next time you can give a quick
summary up front and point out anything that is out of the ordinary or
needs a closer look.

