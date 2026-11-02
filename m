Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072B9607B45F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FiZLJV9D;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=hxz9Hiz1;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Aomf/3CK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=484HwFx/FX8eUsAp6rdv6+8bF4sa7KT2ObkhjoCH2xE=; b=FiZLJV9DOICh1Z
	ar0CU3uCnL+IkGo38wkQN3S2uRMK3XkcDqq5xHYN2yEOpHx+mLi3Zs7Xf7WSZGSIDfn18YpjtjCYX
	AD78UiDt1WnuqQlyg3702eoE+C2wH78kG+6QBEh7leQ+n9IVCmIyMPdjZFz7Z1ckzK1nKS7+iW5BQ
	R1I/b33HL/r7rtGZTCm8OmY0M8q4l7cnzxcH/uGACgoBX7nYmyo8jfuiX+Y6E2VZJwhxyfPKAB6rO
	sjzXjtsUa7TfsgVUOifiw72ozRVXQncDkc+c4g6R5/4q+0nq6SJQBN6jwyDy13twvHw+RU56/u2A0
	Wv+SNFPCJL9RyP3FbnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNt0B-0000000Gohg-2kGu;
	Mon, 02 Nov 2026 14:27:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNt0A-0000000GofS-1aDG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 14:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=484HwFx/FX8eUsAp6rdv6+8bF4sa7KT2ObkhjoCH2xE=; b=hxz9Hiz1O64BQSDTpa1E+q5gES
	NlFnJgopxtzfH8iHuxyXr6zIdeF2doJMEsToBnMPkQprXT5mornVydZZ5FXaGnvvrWXDKfBvMZ6HO
	UNn6z/gPbHeFUJrGxjOtb0HbunW7Y7VU+MiG0zOjaCVbqXO0Ef4622SxJTZeKuJAHbiYd8xe9XSYs
	u3NKwzDphH4UfaEmCX0mWlmI5SW7dJNPtAGPjY+3Z7u5/swccW2ldBTyPwJQa/mKE/9nzp4JMlrac
	AhkvNt3RpcekhlGipB3zbfR53NvSFTZPAIyAc5mkAU1ERNhOaojVxEgR3GtXIc9VsPVlsucNbvEze
	sa7aQNbg==;
Received: from mout.gmx.net ([212.227.15.18])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNt07-000000037kl-1Vdk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1793629618; x=1794234418; i=wahrenst@gmx.net;
	bh=484HwFx/FX8eUsAp6rdv6+8bF4sa7KT2ObkhjoCH2xE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Aomf/3CK2nzBvc1hBtX7Pd00YHGzRrx8S0bBpjgpozD+1crrSogjfnRLqSgQIYb4
	 vBcEX1v6BhM1irX7Rc/nWeHRYZCF2/bLZgntsL/VlLdTdlDleLGGuqssjDSuxQtXN
	 QRkFepcdCh9o+3f9S2ZWV1tTVIxEqJIEDyzBGEcnGPVtc7PI4BeMWx5eDcS1Ug2EU
	 oJWSnMoO20xKAuXagCHwmyR1XNncN5XABy/f2g6wvDpVi6VjgbvXOh6mYj6dFd6ks
	 Xsa7Y/9cSgEZqcVK4Ckb/gIsrcUlwidvxSxXimUU9sBl9K/oyhG2fuazFKqh/njO6
	 Jf1r0ZILGTD45+uBSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLiCo-1x6M9C0z5M-00Z7j3; Mon, 02
 Nov 2026 15:26:58 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V7 1/2] dt-bindings: arm: fsl: Add chargebyte Charge Control Y
Date: Mon,  2 Nov 2026 15:26:48 +0100
Message-ID: <20261102142649.8566-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102142649.8566-1-wahrenst@gmx.net>
References: <20261102142649.8566-1-wahrenst@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vXf0hlf8XTDBgMIy15xMVFNinxMBubY8JUiC8Du4CPA5CNuoqUE
 lmDmwPl7IR6+TS9T8DLWgceBAY09AygjKSlGFwjFQRVyfojz0uFZgIx08mG4f0eBwlPCa1f
 XUschTdBxoXvvKqD1+2gL38GX3bRTPSbpBnKP9EXM+hol3jYRvwNmGuIYS9FZNg4R4i5Gl7
 zwt7B32i+lcU5hG+PPgfQ==
UI-OutboundReport: notjunk:1;M01:P0:NICuYq1ty9s=;nBoHcKKr6EVDWJKnDFDqt9C0gvU GDbj4OT0lDaqStDxOB4Vd+60GgzNIvpfp4zKJNeNapF+dKv7vNk+LsproBiZF0CfI7i3gVOne PhqMbzNVvKhoN709Z616f/UkDgyaURwfV+cktZzt1H0W2bDRcN/iWW+feCwz5STa/ogYQW/Ig +RtCotuJmjuu0qEU+npLSLhnEpihyQq0H8/ECzaMn5pPeISo0m213uDyHeX8qz73iPuzGXhk4 Q2m3CnULNTJiWb4dzDJkDMRT9wox9Qo0ER2PPz2vR81CGrsgSbN16mvTFi1SrWZP7BqbjyV9U haxYVGxIWG2KCwVoIJ+M+qMih2FFr3Ck9/G/HuP1CX1nb9emOHUfXFMrnmjLD9/Iao9eRxgPw jBTPma8j/CpWJI3WXy3YHVHsrLV4NA/xNa5YduSx7t2GcOKiqVMFc5fa+Hy9lYauimac9m5xc HbuQZCA/AqnYps1NOdf9uMOmMiRgg4f1vHRrkeIqVHFUM3sE2Ud97l1GHVgwh1ISz2L7BTaiK gyCNRZm0CcHCSPgzzNtHRHzSgh2i6Qj/+kBPwxJjm1M1Hm92vk5+b480IXTLS8YFmd7GJZ6hw L274IyC8lHkz+otQiABmYveOZbvz4vS16Us8uU+0vnFLLcTMQ6W7JrOXqLAJBlR8tlAHJHqTW ItzG5R8GwY2DOTxCTmFQXagvVQu8JWayGVDyxVnSJn1KYWGv6D4l6G5Do2HvMdjZkF3YTiAk0 l90H2gsZOIACfFW53yIuFfQQXuO3APNrgJrQMHCdJ+u4ftfAo0KEDm4XL6GKydvKG7YeXRgGu MZSHExT9PTStX1+weaDIGxlE2nQyt8rj3jhYnYlYUJUV9ZzjmBShatBn170qqrpyXemMd8OkE gK/RCk7hrHHVPR+0KEX/S3YptNZ6rFC6DBA+1DN7Wo5cjcdDRWV8Er7o3CbkVBKgdlDCr2BZr 3Qo8C5P6mBw9CoWB9Kwb15E2ASryQYamIeSjX8jKzy0MfLYetxTehSy4by+ZZpPaSfF7XefzN O/fHNFNhwcFclC6Po4NWNoaLciH/Jsx+Bzs80hUd2Nr+UVr+l/mi7THbpqRnUVSHsy09MsFx2 oMZpD5UY/bkBdycn8aAfJXHibCmruWJ/iQ1zazKmBEzesA1YtIulRr+8Qp2d7hQM3d+ZE+Xfm Lmj+O9LdZsgnOdEsmIZlxZxuuEOEGuGVHnMzZHgIuOoXZ9tVn7z1hWuW3xKGzbYCPkSnYB2To 0TM8FtDY0q43vnE0DUOE/ZEl3106IlN4jpMz7ExJWFP4s+pCQb26fxoStb/Ejn82VaFmvVqQM 1Wo+F6+UFXC2UM6rxKW/Ek3marJZEFf3XdZPfFnj8pE181W8lgLbgzCTDGMr8aojWMSP0vbJp WV57fU8jnfrSkJGMO6ofOwuQQoWkd2AHcsO/+e92poENraA/kr0TCr7ZRs2wQZqcB2dl8HHaH +EiZpP/mL37d5IGzLXNKUELqz9FTYpovkZMMfm5oD7GG/FLF5PVZTFkDr6D7wkVm2wdsbLXMv 4P4hV6GLSdUzh+CfLb1vXfDjzitDIoNLWLbTV/OM7wN8bcpVZXHjltsCd/D5jnJM4NBWx6wm7 JB9nx2hMsRfW+bVPpqxNc8h20X/ftjTWJBHK7cKL3OLIN52uEDCt/AWvYbcA5Kn8lLp2HX2/4 IRExBmrTMa/ckSGsAtRxDG7VJYATVKDcmtoiS1PXHuqQDC3CsdJVysJBH05Azlt0JJnqn1Y6W Z5AKfJf5uiGrPBtANeLZ6RKfCPRUg6J/s5JfDzq04Rh/dTaaTgztQN/ERDWto63jm0j0QY1NI tzR6H/JmBbr4vJ4Gxupm2GETvhRTFA21KJaqH0/n1eeNbHPKybfN17jc7XnZIwrOp1jbcfi33 PFM0YW6NyIjPXZXQuNeFXhiTxCC06W++iYksNvJe3aag6TpFdy/iO8xSDrU8VBDVAg7ovEq9U uUfV4CXlgLJ/8I6NI5U05fDynskEU0VOJz4jwOB7EPK4Jm6Co5qO2HRhPHahhMMu2KkFq4RCB lZ28f39kdb3goa7/s5xL7LwzLqb64umZuCunHTzP3QW25FnbKTvft+y+1vYxM16zDYpxaUmjl sszG2fSGvDpo714kAFOa2o7U4UPD81WWyD86UzZrMUKOSQPq/wuFOZuQ++cVdiXFycjyd5lJ1 j1cIu8aUm6kCvSz87SPvUm8cPmwxWfykxZMfgxP8mOT8kuWdlLPnDzvQrjiI4izoesyu4qKZh 1AMYJqv+Aau/J+wFg7IjqW13D6sSoqYOXuGN7FMGRmB46hR7s5n8MvEMymQ27sbigZdJ6twVd kD3vVoLZqiSTyK2KC+eEqqMITLNRLkKGnD9DHL0OKl7gms4idbN28GkCC23he4ewDOIdHXHxw NqPDRVqlCMaj8xG3QrUDQBbSJlbqDtKhHuiEeTUQihthmkGz4XZ5Hj7yYLLa02CoiVu2XLc26 LUunC0ZE6xPKyK4jKHgFm3AwubVO8v1Jmi8Xlcj+OhLyRBXeLd3xVbxOnJKJbAAGpkBwg2Hqd Y4lSjs0XekWnuVp/TM7uLMWCMujltpVhrOdMoSo6SpvA24kUcyrruNo2kqPPVJYI0uIrU/2sp ieTzceU3Rv+vnH5S2eJZXoCVtv0ddQhyXJM3/ceGg24+4HD+MuQr0xM+0mhlm8i5ef/92Zue5 +K5gtWNf/5MxYsYFpiGoMpwdYnaIhp5htR/m7IQVzTDrMjC9/t3Gi86NQ+/eriDGI8QvDGux1 ozwEtGNWmZcJMENqd+rT2zAtlE3mnmj0tIB4AAh0puc5E6rUyx4cKerv9Ryj8nFop0VqCvhBC RmtECCSxBOJV9ZdRe0CM3fgjb3k6acTrwW6ChubNiT6QAChXYBrAOxEkoI86RPUh9yN5Bls6n P0j5io8Rx6X2lSJJOp59N/N3i+8ciH+SM8+/WJWEOq9WS1N06uIWqLYd9NYFTNIQy7kqC6EGX Ksbmnin9lgxdtDumV5MDjjFvMZEpMlAG17AVnzVhrlYSh/LnjwkHI334VG0PzdoDl0BtDt/kS zvjUNUZcWwC+WmnEsn015pyUrFiPFqqI83E6d+8uqJSiaAnLNhiwfHWXyBVx/hSE+Qd3j2YmP f97+IcnDxPwb0w4u9U7HokzmhkFSi5dfrdIYWSia68SMTQDfSrpUlMj7n00Ov/J4p7PYgd9tF uRdepvPzD0YSgqEphW2CCPU6wc3tjLNveJPYpDBqvl7EfKgmpLSvUHkQKwEHC7EA6vodYs46I +FAKk2D3MV4Bb+aNpzp0lceHiGTmYMT9utXe05sh8pDuZt1SgXWrfKGJOl3L8IjLl8xYc8exq 8BNJN0oK/ZNdsr9PHo3LV3OkeuxuN7sXmY4NN2k/ufuONO5mLfRtq/+RLjZ6pN4fP+kTd58P9 KbevlmPl5smneUSexecyoXxp6X1o4fHQRBYbalicb0RX9jefhdd1Ns9Wc2p8M2VAYV2iPg5hs BLTyPm3o90yQfq8Lypbg/LGfKItrcMNPpPIvyUGTDZHhd7o+BTlC2SC8qRhOrtxhDnPSlLXpj 4upwvIwN7SalEgpeCWK1abNftAE0gDDYQ/uFRwSg7aEMQBpZ+KoPaUDPN0ocJCwxB7B/QAexj kY7Ktt6b46t/HbzxcTZw/vwc0g1+XthhkDIpDFf0dcyPXXed3gTorKN/UYPOCUne3EEOPxCzI OeK7MxVmJUM5bkvfV3EwGbeyiuqpQsbViMOp28aDM+ZgCL7xJyMkVlQ4jWF7t1dVIHUmY8PiU NYSwVbeCB+ZITzY69ata7GvfBx6acGlHrPp86b4KrLJp+/Rtt7gR7ZVl4SajYW0NUYAwtT/fi IoC17XFFyz2P6VJDgl66bu8+wH7pIt9ju+GwHg+KPQP+05ud4ogBlVarvXhqx1TB/lKR6Ev19
 jGHW4drZT/toDxAIa03GCZfUcS7V3XdmhVSad95o2FEhbJixI3ufcc9EanmyWE2d1KY0VN6vU gPmDH5vNVOlE7SjMUWYIa4MZnQeagDT93VdAhxG7BlW7h8O3l5FeFvWiuqIQAveQk/QRKhs2Z d1ZGvJbE94OOWVCEw3qGzSKaRvU+eqZnp57U5BFxkE9klBpbSeUilYZ4rLqX1aVoWiogpwiTt osZj3cAqG/vtiEG6De2okKhG2Mw+D7VnZ6rlGbQWZ44BdowVMGfclf8ZOukLMtslzfZ6n1F/2 peVj5CQo8QbpRyyTSwcO/td+2Hao21QIkLig5PLntkAbkfvGz/NzhtTyly7r88Cu05LrYuCqT YdjlT/6s9Dfn5u3lBND1nVOIN/z9LdEdcWkaAZureoXNfpYK5PAWiYGENBgCqAZta72hKDAmI wDwTS0tXS/IFaU/R5UXSRC1pmqmS3LOWoNv3DlBRPQ+12lvmyh3TIMVfxrqHoAIkotlo0c9qD M9LdDdxzD5diKQuvUcPxmrhFbK0npC22A8tVTIeQsYHtLm+Z/exXRQx8Yy6J5UERIMRM1ffGM aNVPy2HH/edGEpAJdXYupwzQMLjmZWuif7CyeizspoIu0EWQzkwVKz1qNYQfZJrcTD1YzkcG4 +p9dSreMzaQpmjkXkv+mfNTbDHB5IDJVAh5/9Ekh/TmYt/Rqukwf1G0bxlhRUd7SUJYawk35s J+7NwGzI7eRWedoiqA19+WyWabMsb3n+cCOLBvdHnsgdha2FQkFB8sZVboW2Sy+OypzEjmUTQ zDbtFi0TJWQKVSQiTkdgmAE82isoUohP5FWM6D773BgA1Brt2/2HYlODOBWqEvGm6/uXiHXWm bPSa/xFOj6qQnmNesGG5MWdopWifhAWEpP24wlSRm/nTcjl96jtE6KpiaE8QO6cHux1C4tPQ5 iZxG6/nqm8aXHFvUV81g4kK2E1RSq3n3f77CP5Avp4UH2O83sDP3epeXs7G6M8QtX52OsGKxw vOoBzwTRUaHIFWV5pet7yiQ0IHO9DKrqoMsWY1HIrh1d65iT24W+60l8bxEQeqmtJM4Sddf9X a9w5cBKtEI49CKtIR3uwa6dYrQCLtjclzs9+1bCIPmLNdFYsu7hqBLGCOcLZ16pAeatht0D2L kRk+qafl4QJE2rqt/rJfQDFwwnLwqnYLnPGEoCQkmMutPgGnhUlHCIdIUx9ykyF5cipi1pt5O ZUP05qLV7hsa0DEoYQSlEnYxve8lvQbtDtHTiv37ZumX95XDwJ7mHckmFzK3LPt/N60OTbn4h vvxCb3C0NgOlpXCqg36cGNGaMwCxI6dz7seyxbs8eIChzgpmU7K5+Q+aTvW6R4B9GHAbJcPkY oNPAgwGf3wcadyxhqQ2+Io66t1LXEHyPfDqN073mVfmYGdMZZT/GbOg+DxyYEY7ntOOcbRb3l 8uLFWMwXacM324te1GI7+yVFTSBAXtF9qWZ72YO5fuzfTvMou4RaEAHqsDzylhH36EzOWQ4I1 FJN9c76V17PG1NvYJufe/6rynGBa1HhB9JJ9FNP9T4eQ8AVfHEeNR78YZ8kgrTT8l0X+xlEIw V4BPFNR5T+61vy1WNE8M7UxVzWXYivVODUosFZRrK5I0yBN+cHRYLjdqqbXTBEDBfQaCxgnSZ ja6WVyPHHbtZrlNYgus4YYOaL4VmrRGDAJHc6jmgq8jTPv89/D0GCznlMVI4b0ZIWGQUGWeNs Aqo3C2qSXIDKdebBYg2oSQARB6e9ZniKb8ljzvvftANcwLDGECN6sPGM6+2UoJvyeOGNs2Iq1 jfSs7v0UfjL3YC8QfwhHgztIhWLBYKmMYD20EatR2KpKEGWbalTNwUomvrn27y8B6mYAlb5MI fojPS29SdTcE9hVNJs7zQN8DJhRH6VHz/IB9pHgenUx7GQNaOiE/9MixjZgInMDFslTDm9HYY 50cCGq9FbNr1QaKzoPr8y6a5xNCHguIE/yUIc5yehsWF6rmUv/HRI4p2SFnKg0m9MRf4rAxQU PB50Bgs7QakawwkxtP7Gfg1Bd3tUmwVOSTvVdZ775FjRjGiET7lXYJyIH8aGhIMEgKBE1gUIX 3aXLsKm7iRgnC7vFAlMy2WDTRFliADg6W20Z8cCV3knmxXydWHesQP7NVnEMRK+1OHVwqnsF4 vyan5OQgC4vrhzkLE/TEwn7CtSFfUV/I3Rv4xqPRfa1BkXq2dD7/yaMU498e94FcSFKrRAJBP 6VjR5cF2O26bo93PQNkvXzfMuRB3qjwu4Xpst+K1tu8k4+B06USH3v98kZEJY07YYb78vje2I K28wNQWmDeKira2scYNfSosm5C7qEgu7rArk6UVzZNcyn6GO68WZdaM9+yAxDZNgDPbDw4MUp 0CEYcEyy8s1DRhpij0YxYCjc34BvDpgsrzRIGKQZ7wr58GT5NQHARGyWZtIzy4nLhiJyhtWZJ 7l50vJOH3KOjaZWNlHkYE9i2DEkxEv8/FTvpMcAEbzDvQR+U8M7KFguxOnsBnpBNxKcDZ4G/C NYmLUycQQUh74ke/Kj8BaHJsk6OdVy+0rfMGAsiTZwWlwpkdHB8GEYOVyolzUjMJCDW46w6jW N/yBApgez4NcF9VF4ipxnDUO6CpcLQD3Vt2lDLlT++N38SsjblxD9x/u/sNZ1r2zo0lbOvl40 ojlS+KMX0lK6rfIChrvLnBhhfY58xBkcfiajPSuxwV0GoqAL1HUquIm1BTKgrYuB1FMmm+Y7H fXaj57lu2Mv/mqBcoJCl4V9cpRd08/zed1/SiRW9xJg7m4sq0FGRfNLJ84WfALqiaaioGRTV3 dsXFPK+sWvvDaUXsOST4xh9h88Mxjfy8+9qZTifUDo8Dcm1wa+sqEy0+4G0K5+xpX2mjP2dHa h907v6nyiLnHynH8B5g9YP/ae+5GXwbncrOc1+wMLc/Y0TlCYSCXMcR70WJ6tmOGI2EB1MSRa eYE0cpcEaUlD5AL0kuCAVifqAgBiayKuFJ4S921ijY016uVrsS+quGTz3XFHN4xS6P0Kd1UkN e5ptCalMOkPyZhkrrodQyzok/mHM72YkacB1ZsXCLd9BW2b4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_142707_479070_31114F71 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -3.1 (---)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device-tree bindings for chargebyte Charge Control Y board based on
the PHYTEC phyCORE-i.MX93 SoM (System-on-Module).

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
=2D--
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentatio=
n/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..36e7a325af5a 100644
=2D-- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1722,6 +1722,7 @@ properties:
       - description: PHYTEC phyCORE-i.MX93 SoM based boards
         items:
           - enum:
+              - chargebyte,imx93-charge-control-y # chargebyte Charge Con=
trol Y
               - phytec,imx93-phyboard-nash  # phyBOARD-Nash-i.MX93
               - phytec,imx93-phyboard-segin # phyBOARD-Segin with i.MX93
           - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
=2D-=20
2.34.1


