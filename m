Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D407CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnrV0+DPiVIACPvAr8Fl0xa8D1+L0vCJwCOpEsnb2ic=; b=IcQLHsP9bHzHgYUL0AQNXEoEuB
	d+s0Xvw7RBGhao5xNiCN+HJH8qrUzh1Fh2P9TlzldK585+IdtLSyRNrN93+YTRK5uJ5A7CS86Oind
	6VJZzMgFRYCCNVQhit9knEiy1uPaQ/kQsHS4C258uvUIs+erJa12EQS91bJQ/5EsTktC4TLkvU2k8
	oDQZrJ75KX4Yyv8WRRmk7jAruq9V2PIrc02FA6Xyva5xDHlMvf1684b53guoORnjhZkB8r7gFDF6B
	li72niFaCTiydQREW9240IjZDF3wNsQWidAaMpxHGQTtvMaQCSZ/IbL7qu3ozBgt2JLcfAOvZ9G4+
	K4bPx20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf3S-0000000Btoi-2nGw;
	Fri, 02 Oct 2026 15:20:10 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf3O-0000000Btlv-1lO4;
	Fri, 02 Oct 2026 15:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1790954393; x=1791559193; i=wahrenst@gmx.net;
	bh=ZnrV0+DPiVIACPvAr8Fl0xa8D1+L0vCJwCOpEsnb2ic=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=J9gXLTzzFHQ8yDM78hoVDo9Hx0E+j5kisj9MditHgNZVHhBtMCpRpZLtf1wFMISr
	 7pbHTmztMXzRc0iBWxvE+O+6EMNBXTwgTOsJz3itUt5TRuQOkj69qjhzSP0AuWvvC
	 CjOQyPMURh5BEWHzYFL+F8YXbd8zA8OvXL5OvEGKuEaHoEbUWBesmXPD1RQHtPsHO
	 khmv+9ryLltyj4jM8NAsBlNXMAwgNAEa+lMljNZbvJ7xc191pQSUq8FG1BMeGo8Gs
	 kpdOVD9lBtpXaT8teXSbGf1q6wIbV2i+3EmPpjy6g1iWs2kuwhhmcdd7EEeq7Gk9b
	 zgvteTFrzPkDtXaPtQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mBa-1wimpx2exI-012LJb; Fri, 02
 Oct 2026 17:19:53 +0200
Message-ID: <eae93f2d-913e-43ec-b882-26e33ed96183@gmx.net>
Date: Fri, 2 Oct 2026 17:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] rtc: Add Raspberry Pi 5 RTC driver
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pbrobinson@gmail.com
References: <20261002102419.830595-1-sander.speetjens@gmail.com>
 <20261002102419.830595-4-sander.speetjens@gmail.com>
 <e49fdbd1-dbe9-4c06-9797-492db689d894@gmx.net>
 <CAAOJLPES726fWp_6SUaE-S7wGVzG+msEL7RRL2uYbzW7OWbvcQ@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <CAAOJLPES726fWp_6SUaE-S7wGVzG+msEL7RRL2uYbzW7OWbvcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dhcFYh6q7jwEjhJyjD/CHus3j939IC3Xqpy8txIDZN/pHrLo+eb
 MRda3PnCZVayZiu361gf7rCXlvjyspyJXNisfgax6BbfgR5/OrWqs+WonOya4kIc+KHIAhL
 9XPwkHGcqdOxO50V6UBqdHeLY2gNgbFV3fIzqzT4HXllIX7qsdLhPW6gZfNvt2JNF05oSS0
 hnkL9vJVw8sVS7te4ecCw==
UI-OutboundReport: notjunk:1;M01:P0:0vAJkvHOTnE=;HK8kFeDjWwQ3n1iOQRBNQaV70gx dM2jEh3WtvIuQa97tQKur5zFiRwvYtS5CPCEOBq4TYDmJsQVbgd98miiIel695OLU5VKadW6G qyaD7MYRC/Z4CQbpDAu0Q2hujGFBANJL814E5F7U6KcvOr7/h1YqL6Im+rxNnou/RUTR6bhqw mEcCZ0aGL2qjjrWqdBNyJvt1DKCk9X9zfl0+dJm7wvQTjsKAhzPsyKstCfRDutHQVOlKIEcqC +wqXfi1HBW5+2/ZxJtRvhIVk82gJHaWSs+pcCyV50lSlDtMaTaabRhH97UY224nH64Qu3B6SO oiXCqYuUGSEl5g6U63xHmL68Pho9aCMKXKj8qJ0Rp24wUua8Hhaiab8DAbwPeNXEH9A7WK56d dUtveR3W6vg4qELkC4Wjsu9DerjkFOZ8xjshk4eTkNgCt4uv9C2Rsae2nvvZZhYU93if6Phei Xg/rrUW/r678/V8yAlXNPb923adYQ8XIDTfR5NDpMZdua8I+fQr1YLv/Bn+1yBtS1jcHcsFT8 uUsbSbIvgD0D2Nd2Wnuyvu9Dycjp9RCaweO2++sJNJvIexxRSD/Z5mgm+MIvFhElWoeIz/U3W RaaCEPWPKOo2tCuhQ/rq79lf3uBKiYq3gwkAXCR4eOgA6d8RjQAmbKJ9R5G0ao0usMWJ+6PnG 9b0Pb75h94r8hEOdrJGTHIUY3ZtNjWR4IA1xydN1EW9VS8Eqy1cZDXxVUeIFyf2i5/Vw5U/bb 5vNFXMAIieI7EzgIJDhlGptB6zlJOlvxLRB7uEePGSdKYMONCP4pm8VGP87kcKHsrLDkjgHm7 31XiuUV5xChHnD2gbT3Mm/cigILwnwdAuGs9z4csmn+cvatuPRtSwJFHWlTIu9tb+5JDe+JCv qRkh+qGPLM9gtEUfUIfCkCPehtRGaUWRJgrQ+Bm8+Y4q5DbxjhzXDQVtACDD2Qv4EsajHUHBp QXmUA4ceG9xnEmTECxAw/BiU1cao0o80e6ipZZAvnNDaffnxIuwollX9tbURnoiUXRGkLMCRo xinqstkOWdozU2Y+vH87TPU7JySVMYzzqkTn/MHTcYL4RX8JRs9ki7EexYG032nXFCDzBaFFZ Y3sAGDDSARMFDMCFVfeawp18kDldMvrPFrXjCL4LQK0o5xmN8FO5xfbx7YnbOfp74qfUI/l4Y gXd6OYVp1eq5GLX+fSJwgHKxTlAzneROoHiyufwmiKiG+oT9G+Yh9jPVwVzsuqUoqGygCzy+h noaQp2+57716Kw0OAvI8d3P2MKwP91fig1UESw4L6RZI6W6lgcYndxJKeorTMCyAIM9A1eoix GXTXKo/GLPktfmaAHW3hyxJbK7YHpgGnVYv3InNibYzIcb2thymZIspAU3Ig/4xNMPwog8a3B wQr5fREUEiIJN7BkizGQz4SLnR5LnnFpdJ/Ani524gbwTfut8wWBvOI3W7QsI8yo0d5pk7nxz ymdnb4pvwh0IWEKGtSbVk622u/AVujE9PcJfC3XwyF7Ze6DG9pWCcPHetECBu6GgwZGBsCXJu Es+pq1Hkl5BuGhTf5JpqE7llTPy50IP7y4bp+xxQyDNqWcBdVHETKGc9lF8cnCsM4qOFWMSmU oZWa1VFlUPiqlsgPzQvRe9nzvCf5Y0Z+EhNmIAZpaUBV2pEWd30/HL975Zc7cVMAst5VS9Hho vsii+eN8faPFN8+T0gUCkta+kBbbhZRn+vKAshS6n94uNsYOPlCHrX/QT1gWMzGc+Bo63o86j 5N0KJK0qvJ48zMDrcACAGds0gB8h3QSEVSjPqTMP2w+j/dl6CeDOl0v22Tz3AKb7Bhg8MF67h cMhPfiBfbt37IiMqGTVOsroBpBGyLRpZNV1p2DHrgjk8z5r1Bu3DPdI6YfEkqEAQMpIRYJSmA NE9YnDonjsR57Zj83yOXgZfdqxOhYMktbkrXaoCQBP1g2fnykKDYLKsPeRN2NdJNAehslF1Mn P07qlNPlZCFTK0JAwvQeaWI8124jGd/U9QKpEjWOehyyBAlhzCG8wUOk8o9+l28JyoiaJiZ+U lVhVc0IHyjyoffLSdG1/S1mIZPCTMCfzzQdsqzj4iDnRkXYHaLSxvtSoGRHgZjIhKxaCOdkAa d31Kn3Mq4HSVzZ4aZrLeF2S7y/glGBRrkSWmZLf5epTiO3HgTbE7EjkR5L4o6ErPLcz8+aQCg mgojaIh8u+QdUTXkaO0WNX3mhIxwTV029RW+gux6ELSRAa5obqu+4T4W7zruPOl37+QRAZZ+6 6A2DdcIw1kNJdUrocwBPH0BY58bo8OKqDQhF9hZgxtzaQtpKE+QBVuCSyTb65yCFIQ5II8hmM hocW8VesQII5DpevS30nj9t6gEIlMH0PaSFjwoSukAbszWVY3czmq+7q5DkgsMjyLyxBacv6J Fl322m6DwdhI2OWhCBBbUAurxaDdYIRRu+pi95nDaP/FW4AqNC24xDadERlI+610nhOmfXIPe 4q1ufMpApcFBU7jn560QqD5iE90PBQHdKiV+wWfFfyYKVrQmB3Rtq3LIxk394GApxf/n7UXJ3 FE7u35o6rfyGlydQTrvr+PZWEaRWPI/nZd8c7wjgpaW/ZR8Woc9esI4Cv9yxJDTgR3zfZx+zD +cthN2QB7AwDTbrZs2aJDHileTWJ1AWCUzSdNZ/iQnR4PRZhhMrIAjOD4npGf13lHhKS5QZg0 9e3iNlCSmUZUSoVK6gX9rCs0YOXLs8g/itjviLv5D5vZHCUtVVksToyWc8/FllrGyoT3N1Crw /FGSmshJ9W0SAyNVIRyOqWxjYRa9CWB2021amMNun8DJ8T4ILfqP5FM7HackmxKG5GoaJDfr9 /LQKNornsIuCpAtdZatInEbkJRPnVMPPFKHB04PYgyGd3cynM9uuZHo4rbGBFiEuMaGEm3vLq XcuCJEfB1JbAlsU7YO6naPp7HOdjAqLU+u1x5K9L1I/D7uiPntjN7z8wivBB5a3mpmbOEZIpy dxF3G05PBtQgkpuzuZJidjno3WphyANsqF2WYw+4LwSshqZuJAW6n10OPUiCWel57qoFrkdrd jy/XCXnSfz2Mv1BnnWAF/l/HBO5D/CqXWJqKJqSH7R3NScsKc5k5IXzVlgzdfLOeV1P2j8aK0 RneBQNsN5rEFdTf5cmDvHDRgMr9Rj5Gnv5fJSHd58C47EXt4wOHNH4HhmfQtDvmOcMsfADmTW qt5hzIs/GfSqso/R6+VkNqJ5YUkgbeKoW4rSm25PUFUYBw4l50ZotEQYxvJ7guxGG6tCX08Kl diJf9wEsMDeDMeDNUjRsAXhWmkJule9DqDRBQjVQEAzwKYH9ib7eGYj1tvhCLkESCnm3eWJBi r3sd2NvgJ0qIY0HVZez0xTZS71vAAvtdtrmu0JXuoidu7GMQtp/3AmuidK8tbXyhHV+o+Appg SDBD0PdnH+ldFsEybgJ457EOyM8H3Z2EIoKogYep+6S8qwdHIBuxzZOpEGvfRBlLZSayoYU+t S0UfRshzSjCj908qZLtYJ/ucOYXkTuAD5KriyPE02IVkaToXKiUFTpSMGNxumvdQ2IOtYXuxl 7iDcHgvtwpUaIwmO3gM3Evub1FbpP8ahkXI6p7nlR8QJDGtfVsPDL7D4n3yuRuPr/8S61uj5M +UPCYYmqAblZQylA4aq/f/npqMqzq9jtEE531FsO92+s42VPXtK0dlFDkf3e4lwf0ZLDFXO1X Q6ESfqcKcu9GEvlMBR7pKGA1jQrG30ULTmoTzgyspZQ/4CuFtdp4u03Csa6dR1iHrlj3tvf0A rDPUoU4Rza1qjpTqqPQXkhXLR7Om8+BDhNAGLQrC0/oMxH7+5LGveSm2/nfrICVyQZEgdzDqN 5Te3XZG35WD2y9vclwH/SIM/fRAocFWCdOEQrb+GZjxhRNlPKD6ypseROf29Mbg0gDnaGQY6u
 Sv35sAS4mB/JG0+1jX31MHJ5Yub8v7vNiZIfvJ1uAq1FY88ySjYZoiWvZo53MrnoCYREjpLRA lyCUkMJpYRjd0wzHZadW78qHmcNFu46cq1LLVD6Z6T6vUjfjFCJOjhZIi0Bcce0fhwBPMPRSp FigpFIaAO1YJa2UMBjEIVi8uJl4WTZJX6qbNEAEhO6kqzga7U1H4mHNLH7Q7H96anxOZmtWo9 RF0a7TbojBkW0JJmikbTI8nmA2eA+ERl2sHCFw6TVL/5l59eZqEbdBpOt4ZWC1ZxO1eJLEXxu Ygu2QpgwgVmTK8Z2EyWgdOLyW/z1iiJBI9mW+j1hf3KamVAWOgCcw1K0pjKT75PaUA2dRHZXR um9Cd1gIurlheG1xEviGMJXh+Da2hyKOMaId6s0Mh9dPRxiWCU+xjiVlG3WUDT3FiSAyOZUBs 3HMpUFA/xlAIu812f5xDfzlZaQ+5q5QkcB2oswUlaqUpMVKG5/IK6GT7yjC4QthcUw1dDpjuz knVsdNjCC7JYaYHJ6kUtmXd+c7cPjmbzqA0qiCGTM4jemRNyJNJMYsd4Cve4jKlOkFm5kxPNE jyl1L80Z8UuS9s8XoL479WpuEocP5a3s3n/whckj2Ycj+xdm6O0WpD9aQpfcLpn7YG29YAPmM KS++Q2uMV6bMOOtK/FEGWMLLbNpvsNkgpNlNEjEcrqjXhmzceKUgLnice26dj7gpG2NaIhQrb ljlLYZSeHD2mVCgAv41FHpPdyQjp59ShDtScCrq4C4Ci8az0Rmp+s8N1z/qFKAUrPYfAehjx+ WiY0o0xxEk64twDC3k08Leslp3tWruIRIVOsD45RcESEIxYH+dp3BvbMJ4Tlq+4PAsxjuwvx5 JUhkNZco+HEeCINeLXXWGA1cmUYWMN/iJ29iukzveJlmLcECKwtNE5/U7n1l0sqam/GHSrLRu vpUf8HXDh6n0Ij+/WhbLW3cL+Vl0omJDkGpyE117kVfTHkmF+TwZPFGIXqQtPJ3h+L0jabEbp 6cySxOSXd256TTyQy3Xx0ngbFKgJr9a4Tot46q2hzpV979m54xhItzwsar9wDUUtjuyfAq6f+ dLtZi8u4VLkwv/WgmSENod9h3SrvLOVPqIX/zCZ5f4B6wtGxpsxnNZBpRJwhxNoWKArU2v8r3 T12v8J6nXD83prM4dAEXc2ekgUE0SfSaiY0LtxI35ekhJr651D5/RT9DbHO4C91Hm9XWkEYif LNb1o2K1MH/WSWhB/9ZJTrFa2+gMcw0GdRnMqBlo7QfDxPwgxLmSTjiYASp7wyznoJFJ3rdiz pqLJH09X2Gk8yEdxpvh/d938UBluQWnslLrVmUTdInWyedmEiSAPoypr5UO7pDEYlv08T00R7 c+VsSOrZWSG95cTJ0nDgJ2yDWETuX8h/e0xXeHEJ/13f7LmjDnzpe9AmU98ijyXvxvXo6gBIp cq7t9BX+kZHsDXNMXsAAqhZWNpMUCBdGx8tWXQdr9p4cTIO4xtHtyN773mkqezF3YeMnjuCoD Tr6HyQULE90HbXiMN52v22uiJt1CLYM0MdB9TYjAj5aDPbZKH0HEjKEht+4soI2EcVwb2qfon 9Nh2yA7RaNGkuhiv6fOsdJ+SVOdZvLjyxmHKNQ925r90UM1XBROUlez3QXjMCw9VEUUPUDEDG QzdlFhcpOhfnHkJgNBKBVsPDjBAPa0kIOCO2+v+KjwhbgGan07/Y0HzlLTEUCI4YI2/tN9XGx Rhn4L61XXOrq4Me7JrI9pVs6z05hG10MJJLFArsCk9aahTSTv68FLsWpYdgwtD8zxhFjgwjOE jCmWCHsB182MIvvNAP6lvYGjdbfYnLJoqMZsOzOTbLS6+wtuQEpnNfcML6BUU7e9LWdJns18z 1uz2WutbbeAL0bvLhMsry01+UCS4XnHAWEVMjUctDJPWQ6HGg8YtU++ya0h94fCQ/YAkXBdX9 G7Yw00eoafvcO9dNRDfuJhfEwW8KV9DXOAWHetjPtTofJGxGpOw2ubiy6SLHbjhCytxEfuMSs TdkZwrMJY87zeWEfokbbj6EXQVzoA1nfuMxnvbNEZPC13n9caSp8esIT4IQ4593hFgh70omIB isQGowg0nkmcn77sv27nDGIxUks7lwdXPuM79VIWJt48XhKNQ4HcCbku5SFw5Rhdd3JfuziBs sxXm5xg+01+eULMazAHq2QFA/XXvvHgmEq568vlXFZ9ijsyDq0MtYBmLIaY6JL1IoWIPaVy3e YdjV6SkMZm7JIKFD/x16FVXYccuN/mTVR1V4U6XuW8bTzapLRKJhalpDgFBqk/SQi/G1wFUD5 ECjwdMi0LKU9o5Y96fA7qIV0aLtQp30632DSJrCos1jjE2GAf5FdANBSvbP8XhihJG+9IBL8r yPFBIPiaLiFT7V1/WiHqo4YPj9Bq3etrG7N1lO3Xdn0wf46p0EQ1Dd1WzVbtqo+F05hQKlKJo azP6ZSL0LSMLqnpcIu79EwM8zXWsXdlry6g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_082006_760647_85253CC8 
X-CRM114-Status: UNSURE (   9.89  )
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

Hi Sander,

Am 02.10.26 um 17:02 schrieb Sander Speetjens:
> Hi stefan,
> I was thinking of making the raspberrypi.c firmware a speparate patch,
> what would you think of this?
> Because it overlays with another patch
> (https://lore.kernel.org/linux-arm-kernel/20260919034840.28593-2-triet.h=
oang.dev@gmail.com/)
AFAIK it's not your job to solve these conflicts and sending a separate=20
patch wouldn't be a solution. The best way would be to get Triet's patch=
=20
series applied first. Markus had a objection, which i don't understand.=20
So I asked him for a explanation.

Best regards
>
> Kind regards

